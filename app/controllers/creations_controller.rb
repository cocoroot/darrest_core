class CreationsController < ApplicationController
  # GET /creations/1
  def show
    @result = LoadCreationLogic.new.execute(params_for_show)
  end

  # POST /creations
  def create
    @result = CreateCreationLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created, location: @result[:creation] }
    end
  end

  # PATCH/PUT /creations/1
  def update
    @result = UpdateCreationLogic.new.execute(params_for_update)

    respond_to do |format|
      format.json { render :show, status: :ok, location: @result[:creation] }
    end
  end

  private

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
