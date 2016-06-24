# coding: utf-8
class CreateCreationImageLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:creation_image][:creation_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    @creation_image = CreationImage.new(params[:creation_image])
    @creation_image.valid?
    @errors << @creation_image.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]
    creation_id = @creation_image.creation_id
    @creation = Creation.find(creation_id)

    @errors.add(:creation, 'does not belong to the Site.') if site_id != @creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_image.save!

    { creation_images: @creation.creation_images, updated_creation_image: @creation_image, errors: @errors, warnings: @warnings, status: :created }
  end

end
