# coding: utf-8
class DeleteCreationPieceLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'Site does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:id, 'CreationPiece does not exist.') unless CreationPiece.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @creation_piece = CreationPiece.find(params[:id])
    creation = @creation_piece.creation
    @errors.add(:creation, 'Creation does not belong to the Site.') if site_id != creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_piece.logical_delete
    @creation_piece.save!

    { creation_piece: @creation_piece, errors: @errors, warnings: @warnings }
  end

end
