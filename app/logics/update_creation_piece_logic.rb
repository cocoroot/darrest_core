# coding: utf-8
class UpdateCreationPieceLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'Site does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation_piece, 'CreationPiece does not exist.') unless CreationPiece.exists?(id: params[:creation_piece][:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    @creation_piece = CreationPiece.lock.find(params[:creation_piece][:id])
    @creation_piece.assign_attributes(params[:creation_piece])

    #
    # 型チェック
    #
    @creation_piece.valid?
    @errors << @creation_piece.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]

    @errors.add(:creation, 'Creation does not belong to the Site.') if site_id != @creation_piece.creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_piece.save!

    { creation_piece: @creation_piece, errors: @errors, warnings: @warnings }
  end

end
