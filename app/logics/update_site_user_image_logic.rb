# coding: utf-8
class UpdateSiteUserImageLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:site_user_image, 'does not exist.') unless SiteUserImage.exists?(id: params[:site_user_image][:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    @site_user_image = SiteUserImage.lock.find(params[:site_user_image][:id])
    @site_user_image.assign_attributes(params[:site_user_image])

    #
    # 型チェック
    #
    @site_user_image.valid?
    @errors << @site_user_image.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]

    @errors.add(:site_user, 'does not belong to the Site.') if site_id != @site_user_image.site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @site_user_image.save!

    { site_user_image: @site_user_image, errors: @errors, warnings: @warnings }
  end

end
