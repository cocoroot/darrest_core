# coding: utf-8
class CreateSiteUserLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:user, 'does not exist.') unless User.exists?(id: params[:site_user][:user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    @site_user = SiteUser.new(params[:site_user].merge(site_id: params[:site_id], tos_accepted: false, site_user_status: SiteUserStatus::INTERIM))
    @site_user.valid?
    @errors << @site_user.errors.messages

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @site_user.save!

    { site_user: @site_user, owner: true, errors: @errors, warnings: @warnings, status: :created }
  end

end
