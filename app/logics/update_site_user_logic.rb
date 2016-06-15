# coding: utf-8
class UpdateSiteUserLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:site_user, 'does not exist.') unless SiteUser.exists?(id: params[:site_user][:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    @site_user = SiteUser.lock.find(params[:site_user][:id])
    @site_user.assign_attributes(params[:site_user])

    #
    # 型チェック
    #
    @site_user.valid?
    @errors << @site_user.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]

    @errors.add(:site_user, 'does not belong to the Site.') if site_id != @site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @site_user.save!

    owner = @site_user.id == params[:request_site_user_id]
    { site_user: @site_user, owner: owner, errors: @errors, warnings: @warnings }
  end

end
