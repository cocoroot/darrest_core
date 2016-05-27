# coding: utf-8
class CreateCreationLogic < LogicBase

  def authorize(params)
    @errors.add(:site_id, 'Site does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:site_user_id, 'SiteUser does not exist.') unless SiteUser.exists?(id: params[:site_user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    creation = Creation.new(params.merge(creation_status: CreationStatus::CREATING))
    creation.valid?
    @errors << creation.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]
    site_user = SiteUser.find(params[:site_user_id])

    @errors.add(:site_user_id, 'SiteUser does not belong to the Site.') if site_id != site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    creation = Creation.create!(params.merge(creation_status: CreationStatus::CREATING))

    { creation: creation, errors: @errors, warnings: @warnings }
  end

end
