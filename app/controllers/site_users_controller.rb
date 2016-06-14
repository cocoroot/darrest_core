class SiteUsersController < ApplicationController
  # GET /site_users/1
  def show
    @result = LoadSiteUserLogic.new.execute(params_for_show)
  end

  # GET /me
  def show_my_info
    @result = LoadSiteUserLogic.new.execute(params_for_show_my_info)
    render :show, layout: true
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
      site_user: params.require(:site_user).permit(:user_id, :nickname, :biography)
    }
  end

  def params_for_update
    {
      site_id: site_id,
      site_user: params.require(:site_user).permit(:nickname, :biography, :tos_accepted, :site_user_status_id).merge(id: site_user_id)
    }
  end

  def params_for_show
    {
      site_id: site_id,
      id: params[:id],
      request_site_user_id: site_user_id
    }
  end

  def params_for_show_my_info
    {
      site_id: site_id,
      id: site_user_id,
      request_site_user_id: site_user_id
    }
  end
end
