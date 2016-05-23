class SiteUserImagesController < ApplicationController
  before_action :set_site_user_image, only: [:show, :edit, :update, :destroy]

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
    @site_user_image = SiteUserImage.new(site_user_image_params)

    respond_to do |format|
      if @site_user_image.save
        format.html { redirect_to @site_user_image, notice: 'Site user image was successfully created.' }
        format.json { render :show, status: :created, location: @site_user_image }
      else
        format.html { render :new }
        format.json { render json: @site_user_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_user_images/1
  # PATCH/PUT /site_user_images/1.json
  def update
    respond_to do |format|
      if @site_user_image.update(site_user_image_params)
        format.html { redirect_to @site_user_image, notice: 'Site user image was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_user_image }
      else
        format.html { render :edit }
        format.json { render json: @site_user_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_user_images/1
  # DELETE /site_user_images/1.json
  def destroy
    @site_user_image.destroy
    respond_to do |format|
      format.html { redirect_to site_user_images_url, notice: 'Site user image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_user_image
      @site_user_image = SiteUserImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_user_image_params
      params.require(:site_user_image).permit(:site_user_id, :image, :in_use, :order)
    end
end
