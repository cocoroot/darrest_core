# coding: utf-8
class IndexGoodByUserLogic < LogicBase

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
    goods = @site_user.good_creations.order(id: :desc).page(params[:page] || 1).per(10)

    { goods: goods, errors: @errors, warnings: @warnings }
  end

end
