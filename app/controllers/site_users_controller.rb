class SiteUsersController < ApplicationController
  # before_action :set_site_user, only: [:show, :edit, :update, :destroy]

  # GET /site_users
  # GET /site_users.json
  def index
    @site_users = SiteUser.all
  end

  # GET /site_users/1
  # GET /site_users/1.json
  def show
    @result = LoadSiteUserLogic.new.execute(params_for_show)
  end

  # GET /site_users/new
  def new
    @site_user = SiteUser.new
  end

  # GET /site_users/1/edit
  def edit
  end

  # POST /site_users
  # POST /site_users.json
  def create
    @result = CreateSiteUserLogic.new.execute(params_for_create)

    respond_to do |format|
      format.html { redirect_to @result[:site_user], notice: 'Site user was successfully created.' }
      format.json { render :show, status: :created, location: @result[:site_user] }
    end
  end

  # PATCH/PUT /site_users/1
  # PATCH/PUT /site_users/1.json
  def update
    @result = UpdateSiteUserLogic.new.execute(params_for_update)

    respond_to do |format|
      format.html { redirect_to @result[:site_user], notice: 'Site user was successfully updated.' }
      format.json { render :show, status: :ok, location: @result[:site_user] }
    end
  end

  # DELETE /site_users/1
  # DELETE /site_users/1.json
  def destroy
    @site_user.destroy
    respond_to do |format|
      format.html { redirect_to site_users_url, notice: 'Site user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # # Use callbacks to share common setup or constraints between actions.
  # def set_site_user
  #   @site_user = SiteUser.find(params[:id])
  # end

  # # Never trust parameters from the scary internet, only allow the white list through.
  # def site_user_params
  #   params.require(:site_user).permit(:sid, :site_id, :biography, :tos_accepted, :site_user_status_id)
  # end
  def params_for_create
    {
      site_id: site_id,
      site_user: params.require(:site_user).permit(:user_id, :biography)
    }
  end

  def params_for_update
    {
      site_id: site_id,
      site_user: params.require(:site_user).permit(:biography).merge(id: params[:id])
    }
  end

  def params_for_show
    {
      site_id: site_id,
      id: params[:id]
    }
  end
end
