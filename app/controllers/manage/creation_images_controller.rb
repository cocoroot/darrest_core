class Manage::CreationImagesController < ApplicationController
  before_action :set_manage_creation_image, only: [:show, :edit, :update, :destroy]

  # GET /manage/creation_images
  # GET /manage/creation_images.json
  def index
    @manage_creation_images = CreationImage.all
  end

  # GET /manage/creation_images/1
  # GET /manage/creation_images/1.json
  def show
  end

  # GET /manage/creation_images/new
  def new
    @manage_creation_image = CreationImage.new
  end

  # GET /manage/creation_images/1/edit
  def edit
  end

  # POST /manage/creation_images
  # POST /manage/creation_images.json
  def create
    @manage_creation_image = CreationImage.new(manage_creation_image_params)

    respond_to do |format|
      if @manage_creation_image.save
        format.html { redirect_to @manage_creation_image, notice: 'Creation image was successfully created.' }
        format.json { render :show, status: :created, location: @manage_creation_image }
      else
        format.html { render :new }
        format.json { render json: @manage_creation_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/creation_images/1
  # PATCH/PUT /manage/creation_images/1.json
  def update
    respond_to do |format|
      if @manage_creation_image.update(manage_creation_image_params)
        format.html { redirect_to @manage_creation_image, notice: 'Creation image was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_creation_image }
      else
        format.html { render :edit }
        format.json { render json: @manage_creation_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/creation_images/1
  # DELETE /manage/creation_images/1.json
  def destroy
    @manage_creation_image.destroy
    respond_to do |format|
      format.html { redirect_to manage_creation_images_url, notice: 'Creation image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_creation_image
      @manage_creation_image = CreationImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_creation_image_params
      params.require(:manage_creation_image).permit(:creation_id, :image)
    end
end
