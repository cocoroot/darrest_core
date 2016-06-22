# coding: utf-8
class UpdateCreationImageLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation_image, 'does not exist.') unless CreationImage.exists?(id: params[:creation_image][:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    @creation_image = CreationImage.lock.find(params[:creation_image][:id])
    @creation_image.assign_attributes(params[:creation_image])

    #
    # 型チェック
    #
    @creation_image.valid?
    @errors << @creation_image.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]

    @errors.add(:creation, 'does not belong to the Site.') if site_id != @creation_image.creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_image.save!

    { creation_images: @creation_image.creation.creation_images, updated_creation_image: @creation_image, errors: @errors, warnings: @warnings }
  end

end
