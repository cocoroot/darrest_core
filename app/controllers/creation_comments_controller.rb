class CreationCommentsController < ApplicationController

  # POST /creation_comments
  def create
    @result = CreateCreationCommentLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created, location: @result[:creation_comment] }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      creation_comment: params.require(:creation_comment).permit(:site_user_id, :body).merge(creation_id: params[:creation_id])
    }
  end
end
