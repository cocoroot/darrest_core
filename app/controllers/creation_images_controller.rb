class CreationImagesController < ApplicationController
  # before_action :set_creation_image, only: [:show, :edit, :update, :destroy]

  # GET /creation_images
  # GET /creation_images.json
  def index
    @creation_images = CreationImage.all
  end

  # GET /creation_images/1
  # GET /creation_images/1.json
  def show
    @result = LoadCreationImageLogic.new.execute(params_for_load)
  end

  # GET /creation_images/new
  def new
    @creation_image = CreationImage.new
  end

  # GET /creation_images/1/edit
  def edit
  end

  # POST /creation_images
  # POST /creation_images.json
  def create
    @result = CreateCreationImageLogic.new.execute(params_for_create)

    respond_to do |format|
      format.html { redirect_to @result[:creation_image], notice: 'Creation image was successfully created.' }
      format.json { render :show, status: :created, location: @result[:creation_image] }
    end
  end

  # PATCH/PUT /creation_images/1
  # PATCH/PUT /creation_images/1.json
  def update
    @result = UpdateCreationImageLogic.new.execute(params_for_update)

    respond_to do |format|
      format.html { redirect_to @result[:creation_image], notice: 'Creation image was successfully updated.' }
      format.json { render :show, status: :ok, location: @result[:creation_image] }
    end
  end

  # DELETE /creation_images/1
  # DELETE /creation_images/1.json
  def destroy
    @result = DeleteCreationImageLogic.new.execute(params_for_delete)
    respond_to do |format|
      format.html { redirect_to creation_images_url, notice: 'Creation image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_creation_image
  #   @creation_image = CreationImage.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.

  def params_for_create
    {
      site_id: site_id,
      creation_image: params.require(:creation_image).permit(:image, :image_name_for_user, :order).merge(creation_id: params[:creation_id])
    }
  end

  def params_for_load
    {
      site_id: site_id,
      id: params[:id]
    }
  end

  def params_for_update
    {
      site_id: site_id,
      creation_image: params.require(:creation_image).permit(:image_name_for_user, :order).merge(id: params[:id])
    }
  end

  def params_for_delete
    {
      site_id: site_id,
      id: params[:id]
    }
  end

  # def creation_image_params
  #   params.require(:creation_image).permit(:creation_id, :image, :image_name_for_user, :order)
  # end
end
