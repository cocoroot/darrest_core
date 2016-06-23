# coding: utf-8
class IndexLatestCreationLogic < LogicBase
  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])

    { errors: @errors, warnings: @warnings }
  end

  def is_number?(str)
    true if Float(str)
  rescue
    false
  end

  def validate(params)
    #
    # 型チェック
    #
    @errors.add(:offset, 'must be a number.') unless is_number?(params[:offset])

    #
    # 論理チェック
    #
    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    creations = Creation.published.order(published_at: :desc).offset(params[:offset]).limit(Settings.creations.creations_per_page)

    { creations: creations, errors: @errors, warnings: @warnings, status: :ok }
  end
end
