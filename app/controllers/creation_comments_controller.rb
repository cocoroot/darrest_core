class CreationCommentsController < ApplicationController

  # GET /creations/:creation_id/creation_comments
  def index
    @result = IndexCreationCommentLogic.new.execute(params_for_index)
  end

  # POST /creation_comments
  def create
    @result = CreateCreationCommentLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created }
    end
  end

  private

  def params_for_index
    {
      site_id: site_id,
      creation_id: params[:creation_id],
      offset: params[:offset]
    }
  end

  def params_for_create
    {
      site_id: site_id,
      creation_comment: params.require(:creation_comment).permit(:body).merge(creation_id: params[:creation_id], site_user_id: site_user_id)
    }
  end
end
