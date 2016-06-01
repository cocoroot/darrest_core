class SiteUserHeaderImagesController < ApplicationController
  # before_action :set_site_user_header_image, only: [:show, :edit, :update, :destroy]

  # GET /site_user_header_images
  # GET /site_user_header_images.json
  def index
    @site_user_header_images = SiteUserHeaderImage.all
  end

  # GET /site_user_header_images/1
  # GET /site_user_header_images/1.json
  def show
  end

  # GET /site_user_header_images/new
  def new
    @site_user_header_image = SiteUserHeaderImage.new
  end

  # GET /site_user_header_images/1/edit
  def edit
  end

  # POST /site_user_header_images
  # POST /site_user_header_images.json
  def create
    @result = CreateSiteUserHeaderImageLogic.new.execute(params_for_create)

    respond_to do |format|
      format.html { redirect_to @result[:site_user_header_image], notice: 'Site user header image was successfully created.' }
      format.json { render :show, status: :created, location: @result[:site_user_header_image] }
    end
  end

  # PATCH/PUT /site_user_header_images/1
  # PATCH/PUT /site_user_header_images/1.json
  def update
    respond_to do |format|
      if @site_user_header_image.update(site_user_header_image_params)
        format.html { redirect_to @site_user_header_image, notice: 'Site user header image was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_user_header_image }
      else
        format.html { render :edit }
        format.json { render json: @site_user_header_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_user_header_images/1
  # DELETE /site_user_header_images/1.json
  def destroy
    @site_user_header_image.destroy
    respond_to do |format|
      format.html { redirect_to site_user_header_images_url, notice: 'Site user header image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # # Use callbacks to share common setup or constraints between actions.
  # def set_site_user_header_image
  #   @site_user_header_image = SiteUserHeaderImage.find(params[:id])
  # end

  # # Never trust parameters from the scary internet, only allow the white list through.
  # def site_user_header_image_params
  #   params.require(:site_user_header_image).permit(:site_user_id, :image, :image_name_for_user)
  # end
  def params_for_create
    {
      site_id: site_id,
      site_user_header_image: params.require(:site_user_header_image).permit(:image, :image_name_for_user).merge(site_user_id: params[:site_user_id])
    }
  end
end
