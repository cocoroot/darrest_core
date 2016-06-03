# coding: utf-8
class CreateGoodLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:good][:creation_id])
    @errors.add(:site_user, 'does not exist.') unless SiteUser.exists?(id: params[:good][:site_user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    @good = Good.new(params[:good])
    @good.valid?
    @errors << @good.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]

    creation_id = @good.creation_id
    creation = Creation.find(creation_id)

    @errors.add(:creation, 'does not belong to the Site.') if site_id != creation.site_id

    site_user_id = @good.site_user_id
    site_user = SiteUser.find(site_user_id)

    @errors.add(:site_user, 'does not belong to the Site.') if site_id != site_user.site_id

    @errors.add(:good, 'is already created.') if Good.exists?(creation_id: creation_id, site_user_id: site_user_id)

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @good.save!

    { good: @good, errors: @errors, warnings: @warnings }
  end

end
