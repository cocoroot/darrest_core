class SiteUsersController < ApplicationController
  # GET /site_users/1
  def show
    @result = LoadSiteUserLogic.new.execute(params_for_show)
  end

  # POST /site_users
  def create
    @result = CreateSiteUserLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created, location: @result[:site_user] }
    end
  end

  # PATCH/PUT /site_users/1
  def update
    @result = UpdateSiteUserLogic.new.execute(params_for_update)

    respond_to do |format|
      format.json { render :show, status: :ok, location: @result[:site_user] }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      site_user: params.require(:site_user).permit(:user_id, :biography)
    }
  end

  def params_for_update
    {
      site_id: site_id,
      site_user: params.require(:site_user).permit(:biography, :tos_accepted, :site_user_status_id).merge(id: params[:id])
    }
  end

  def params_for_show
    {
      site_id: site_id,
      id: params[:id]
    }
  end
end
