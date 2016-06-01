class SiteUserImagesController < ApplicationController
  # before_action :set_site_user_image, only: [:show, :edit, :update, :destroy]

  # GET /site_user_images
  # GET /site_user_images.json
  def index
    @site_user_images = SiteUserImage.all
  end

  # GET /site_user_images/1
  # GET /site_user_images/1.json
  def show
  end

  # GET /site_user_images/new
  def new
    @site_user_image = SiteUserImage.new
  end

  # GET /site_user_images/1/edit
  def edit
  end

  # POST /site_user_images
  # POST /site_user_images.json
  def create
    @result = CreateSiteUserImageLogic.new.execute(params_for_create)

    respond_to do |format|
      format.html { redirect_to @result[:site_user_image], notice: 'Site user image was successfully created.' }
      format.json { render :show, status: :created, location: @result[:site_user_image] }
    end
  end

  # PATCH/PUT /site_user_images/1
  # PAT# CH/PUT /site_user_images/1.json
  # def update
  #   @result = UpdateSiteUserImageLogic.new.execute(params_for_update)

  #   respond_to do |format|
  #     format.html { redirect_to @result[:site_user_image], notice: 'Site user image was successfully updated.' }
  #     format.json { render :show, status: :ok, location: @result[:site_user_image] }
  #   end
  # end

  # DELETE /site_user_images/1
  # DELETE /site_user_ima# ges/1.json
  # def destroy
  #   @result = DeleteSiteUserImageLogic.new.execute(params_for_destroy)

  #   respond_to do |format|
  #     format.html { redirect_to site_user_images_url, notice: 'Site user image was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
  # # Use callbacks to share common setup or constraints between actions.
  # def set_site_user_image
  #   @site_user_image = SiteUserImage.find(params[:id])
  # end

  # # Never trust parameters from the scary internet, only allow the white list through.
  # def site_user_image_params
  #   params.require(:site_user_image).permit(:site_user_id, :image, :in_use, :order)
  # end
  def params_for_create
    {
      site_id: site_id,
      site_user_image: params.require(:site_user_image).permit(:image, :image_name_for_user, :order, :in_use).merge(site_user_id: params[:site_user_id])
    }
  end

  # def params_for_update
  #   {
  #     site_id: site_id,
  #     site_user_image: params.require(:site_user_image).permit(:image_name_for_user, :order, :in_use).merge(id: params[:id])
  #   }
  # end

  # def params_for_destroy
  #   {
  #     site_id: site_id,
  #     id: params[:id]
  #   }
  # end
end
