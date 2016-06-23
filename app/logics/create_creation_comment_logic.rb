# coding: utf-8
class CreateCreationCommentLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:creation_comment][:creation_id])
    @errors.add(:creation, 'does not exist.') unless SiteUser.exists?(id: params[:creation_comment][:site_user_id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    @creation_comment = CreationComment.new(params[:creation_comment])
    @creation_comment.valid?
    @errors << @creation_comment.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]

    creation_id = @creation_comment.creation_id
    @creation = Creation.find(creation_id)

    @errors.add(:creation, 'does not belong to the Site.') if site_id != @creation.site_id

    site_user_id = @creation_comment.site_user_id
    site_user = SiteUser.find(site_user_id)

    @errors.add(:site_user, 'does not belong to the Site.') if site_id != site_user.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation_comment.save!
    creation_comments = @creation.creation_comments.order(id: :desc).take(Settings.creations.comments_per_page)

    { creation_comments: creation_comments, created_creation_comment: @creation_comment, errors: @errors, warnings: @warnings, status: :created }
  end

end
