# coding: utf-8
class DeleteCreationImageLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:id, 'does not exist.') unless CreationImage.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @creation_image = CreationImage.lock.find(params[:id])
    creation = @creation_image.creation
    @errors.add(:creation, 'does not belong to the Site.') if site_id != creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_image.logical_delete
    @creation_image.save!

    { creation_image: @creation_image, errors: @errors, warnings: @warnings }
  end

end
