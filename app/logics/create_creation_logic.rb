# coding: utf-8
class CreateCreationLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:site_user, 'does not exist.') unless SiteUser.exists?(id: params[:creation][:site_user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    @creation = Creation.new(params[:creation].merge(site_id: params[:site_id], creation_status: CreationStatus::CREATING))
    @creation.valid?
    @errors << @creation.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]
    site_user = SiteUser.find(params[:creation][:site_user_id])

    @errors.add(:site_user, 'does not belong to the Site.') if site_id != site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation.save!

    { creation: @creation, errors: @errors, warnings: @warnings, status: :created }
  end

end
