class CreationsController < ApplicationController
  # GET /site_users/:id/creations
  def index_created_by_user
    @result = IndexCreationByUserLogic.new.execute(params_for_index_created_by_user)
  end

  # GET /creations/latest
  def index_latest
    @result = IndexLatestCreationLogic.new.execute(params_for_index_latest)
  end

  # GET /creations/1
  def show
    @result = LoadCreationLogic.new.execute(params_for_show)
  end

  # POST /creations
  def create
    @result = CreateCreationLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created }
    end
  end

  # PATCH/PUT /creations/1
  def update
    @result = UpdateCreationLogic.new.execute(params_for_update)

    respond_to do |format|
      format.json { render :show, status: :ok }
    end
  end

  private

  def params_for_index_created_by_user
    {
      site_id: site_id,
      site_user_id: params.require(:site_user_id),
      page: params[:page]
    }
  end

  def params_for_index_latest
    {
      site_id: site_id,
      offset: params[:offset]
    }
  end

  def params_for_create
    {
      site_id: site_id,
      creation: params.require(:creation).permit(:title, :description).merge(site_user_id: site_user_id)
    }
  end

  def params_for_show
    {
      site_id: site_id,
      id: params[:id]
    }
  end

  def params_for_update
    {
      site_id: site_id,
      creation: params.require(:creation).permit(:title, :description, :creation_status_id).merge(id: params[:id], site_user_id: site_user_id)
    }
  end
end
