# coding: utf-8
class DeleteCreationPieceLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])

    # 冪等ではなくなるが、削除時に一覧を返す事を優先した
    @errors.add(:id, 'does not exist.') unless CreationPiece.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @creation_piece = CreationPiece.lock.find(params[:id])
    creation = @creation_piece.creation
    @errors.add(:creation, 'does not belong to the Site.') if site_id != creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_piece.logical_delete
    @creation_piece.save!
    creation_pieces = CreationPiece.where(creation_id: @creation_piece.creation_id).order(id: :asc)

    # 値を返すので status は ok にする
    { creation_pieces: creation_pieces, deleted_creation_piece: @creation_piece, errors: @errors, warnings: @warnings, status: :ok }
  end

end
