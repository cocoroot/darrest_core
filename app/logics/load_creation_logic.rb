# coding: utf-8
class LoadCreationLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:id, 'does not exist.') unless Creation.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @creation = Creation.find(params[:id])
    site_user = @creation.site_user
    @errors.add(:site_user, 'does not belong to the Site.') if site_id != site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    { creation: @creation, errors: @errors, warnings: @warnings, status: :ok }
  end

end
