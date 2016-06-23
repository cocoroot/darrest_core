class SiteUsersController < ApplicationController
  skip_before_action :load_site_user_info, only: [:create]

  # GET /site_users/1
  def show
    @result = LoadSiteUserLogic.new.execute(params_for_show)

    render status: convert_status(@result[:status])
  end

  # GET /me
  def show_my_info
    @result = LoadSiteUserLogic.new.execute(params_for_show_my_info)

    render status: convert_status(@result[:status])
  end

  # POST /site_users
  def create
    @result = CreateSiteUserLogic.new.execute(params_for_create)

    render status: convert_status(@result[:status])
  end

  # PATCH/PUT /site_users/1
  def update
    @result = UpdateSiteUserLogic.new.execute(params_for_update)

    render status: convert_status(@result[:status])
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
      site_user: params.require(:site_user).permit(:nickname, :biography, :tos_accepted, :site_user_status_id).merge(id: site_user_id),
      request_site_user_id: site_user_id
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
