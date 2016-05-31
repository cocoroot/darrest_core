# coding: utf-8
class DeleteGoodLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'Site does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:id, 'Good does not exist.') unless Good.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @good = Good.find(params[:id])
    creation = @good.creation
    @errors.add(:creation, 'Creation does not belong to the Site.') if site_id != creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @good.logical_delete
    @good.save!

    { good: @good, errors: @errors, warnings: @warnings }
  end

end
