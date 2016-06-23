# coding: utf-8
class IndexCreationCommentLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:creation_id])

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
    @errors.add(:offset, 'must be a number.') unless params[:offset].nil? || is_number?(params[:offset])

    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @creation = Creation.find(params[:creation_id])
    @errors.add(:creation, 'does not belong to the Site.') if site_id != @creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    comments = @creation.creation_comments.order(id: :desc).offset(params[:offset]).limit(Settings.creations.comments_per_page)

    { creation_comments: comments, errors: @errors, warnings: @warnings, status: :ok }
  end

end
