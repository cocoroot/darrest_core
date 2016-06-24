# coding: utf-8
class LoadSiteUserLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:id, 'does not exist.') unless SiteUser.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @site_user = SiteUser.find(params[:id])
    @errors.add(:site_user, 'does not belong to the Site.') if site_id != @site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    owner = @site_user.id == params[:request_site_user_id]
    { site_user: @site_user, owner: owner, errors: @errors, warnings: @warnings, status: :ok }
  end

end
