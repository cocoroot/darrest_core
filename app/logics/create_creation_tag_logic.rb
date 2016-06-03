# coding: utf-8
class CreateCreationTagLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:creation_tag][:creation_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    site_id = params[:site_id]
    tag_name = params[:creation_tag][:tag_name]

    @tag = Tag.where(name: tag_name, site_id: site_id).take || @tag = Tag.new(name: tag_name, site_id: site_id, tag_class: TagClass::USERS)

    #
    # 型チェック
    #
    @creation_tag = CreationTag.new(creation_id: params[:creation_tag][:creation_id], tag: @tag)
    @creation_tag.valid?
    @errors << @creation_tag.errors.messages

    @tag.valid?
    @errors << @tag.errors.messages

    #
    # 論理チェック
    #
    creation_id = @creation_tag.creation_id
    creation = Creation.find(creation_id)

    @errors.add(:creation, 'does not belong to the Site.') if site_id != creation.site_id

    @errors.add(:creation_tag, 'is already registered.') if @tag.persisted? && CreationTag.exists?(creation: creation, tag: @tag)

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_tag.save!
    @tag.save! if @tag.new_record?

    { creation_tag: @creation_tag, errors: @errors, warnings: @warnings }
  end

end
