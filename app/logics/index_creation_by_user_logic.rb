# coding: utf-8
class IndexCreationByUserLogic < LogicBase
  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:site_user, 'does not exist.') unless SiteUser.exists?(id: params[:site_user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @site_user = SiteUser.find(params[:site_user_id])
    @errors.add(:site_user, 'does not belong to the Site.') if site_id != @site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    creations = Creation.where(site_user_id: @site_user.id).order(id: :asc).page(params[:page] || 1).per(10)

    { creations: creations, errors: @errors, warnings: @warnings }
  end
end
