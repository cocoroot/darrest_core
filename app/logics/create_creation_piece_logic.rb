# coding: utf-8
class CreateCreationPieceLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:creation_piece][:creation_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    @creation_piece = CreationPiece.new(params[:creation_piece])
    @creation_piece.valid?
    @errors << @creation_piece.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]
    creation_id = @creation_piece.creation_id
    @creation = Creation.find(creation_id)

    @errors.add(:creation, 'does not belong to the Site.') if site_id != @creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_piece.save!

    { creation_pieces: @creation.creation_pieces, created_creation_piece: @creation_piece, errors: @errors, warnings: @warnings, status: :created }
  end

end
