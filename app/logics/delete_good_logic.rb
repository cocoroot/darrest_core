# coding: utf-8
class DeleteGoodLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:good][:creation_id])
    @errors.add(:site_user, 'does not exist.') unless SiteUser.exists?(id: params[:good][:site_user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    @exists = Good.exists?(creation_id: params[:good][:creation_id], site_user_id: params[:good][:site_user_id])
    if @exists
      #
      # 論理チェック
      #
      site_id = params[:site_id]

      @good = Good.lock.where(creation_id: params[:good][:creation_id], site_user_id: params[:good][:site_user_id]).take
      @errors.add(:creation, 'does not belong to the Site.') if site_id != @good.creation.site_id
    end
    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    if @exists
      @good.logical_delete
      @good.save!
    end

    { creation: Creation.find(params[:good][:creation_id]), errors: @errors, warnings: @warnings }
  end

end
