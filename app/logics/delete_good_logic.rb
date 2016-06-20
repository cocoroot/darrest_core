# coding: utf-8
class DeleteGoodLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:good][:creation_id])
    @errors.add(:site_user, 'does not exist.') unless SiteUser.exists?(id: params[:good][:site_user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    #@good = Good.lock.find(params[:id])
    @good = Good.lock.where(creation_id: params[:good][:creation_id], site_user_id: params[:good][:site_user_id]).take
    @creation = @good.creation
    @errors.add(:creation, 'does not belong to the Site.') if site_id != @creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @good.logical_delete
    @good.save!

    { creation: @creation, good: @good, errors: @errors, warnings: @warnings }
  end

end
