# coding: utf-8
class DeleteSiteUserImageLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:id, 'does not exist.') unless SiteUserImage.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @site_user_image = SiteUserImage.lock.find(params[:id])
    site_user = @site_user_image.site_user
    @errors.add(:site_user, 'does not belong to the Site.') if site_id != site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @site_user_image.logical_delete
    @site_user_image.save!

    { site_user_image: @site_user_image, errors: @errors, warnings: @warnings }
  end

end
