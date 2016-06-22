# coding: utf-8
class DeleteCreationTagLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:id, 'does not exist.') unless CreationTag.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @creation_tag = CreationTag.lock.find(params[:id])
    creation = @creation_tag.creation
    @errors.add(:creation, 'does not belong to the Site.') if site_id != creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_tag.logical_delete
    @creation_tag.save!
    creation_tags = CreationTag.where(creation_id: @creation_tag.creation_id)

    { creation_tags: creation_tags, deleted_creation_tag: @creation_tag, errors: @errors, warnings: @warnings }
  end

end
