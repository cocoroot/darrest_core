# coding: utf-8
class CreateSiteUserImageLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:site_user, 'does not exist.') unless SiteUser.exists?(id: params[:site_user_image][:site_user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    @site_user_image = SiteUserImage.new(params[:site_user_image])
    # @site_user_image.site_user_id = [:site_user_id]
    # @site_user_image.image = params[:site_user_image][:image]
    @site_user_image.valid?
    @errors << @site_user_image.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]
    site_user = SiteUser.find(@site_user_image.site_user_id)

    @errors.add(:site_user, 'does not belong to the Site.') if site_id != site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @site_user_image.save!

    { site_user_image: @site_user_image, errors: @errors, warnings: @warnings }
  end

end
