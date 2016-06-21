# coding: utf-8
class IndexCreationCommentLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:creation_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 論理チェック
    #
    site_id = params[:site_id]
    @creation = Creation.find(params[:creation_id])
    @errors.add(:creation, 'does not belong to the Site.') if site_id != @creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    comments = @creation.creation_comments.where('id < ?', params[:offset]).order(id: :desc).limit(Settings.creations.comments_per_page)

    { creation_comments: comments, errors: @errors, warnings: @warnings }
  end

end
