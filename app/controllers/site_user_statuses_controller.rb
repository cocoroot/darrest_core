class SiteUserStatusesController < ApplicationController
  before_action :set_site_user_status, only: [:show, :edit, :update, :destroy]

  # GET /site_user_statuses
  # GET /site_user_statuses.json
  def index
    @site_user_statuses = SiteUserStatus.all
  end

  # GET /site_user_statuses/1
  # GET /site_user_statuses/1.json
  def show
  end

  # GET /site_user_statuses/new
  def new
    @site_user_status = SiteUserStatus.new
  end

  # GET /site_user_statuses/1/edit
  def edit
  end

  # POST /site_user_statuses
  # POST /site_user_statuses.json
  def create
    @site_user_status = SiteUserStatus.new(site_user_status_params)

    respond_to do |format|
      if @site_user_status.save
        format.html { redirect_to @site_user_status, notice: 'Site user status was successfully created.' }
        format.json { render :show, status: :created, location: @site_user_status }
      else
        format.html { render :new }
        format.json { render json: @site_user_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_user_statuses/1
  # PATCH/PUT /site_user_statuses/1.json
  def update
    respond_to do |format|
      if @site_user_status.update(site_user_status_params)
        format.html { redirect_to @site_user_status, notice: 'Site user status was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_user_status }
      else
        format.html { render :edit }
        format.json { render json: @site_user_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_user_statuses/1
  # DELETE /site_user_statuses/1.json
  def destroy
    @site_user_status.destroy
    respond_to do |format|
      format.html { redirect_to site_user_statuses_url, notice: 'Site user status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_user_status
      @site_user_status = SiteUserStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_user_status_params
      params.require(:site_user_status).permit(:name)
    end
end
