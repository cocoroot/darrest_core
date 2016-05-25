class CreationImagesController < ApplicationController
  before_action :set_creation_image, only: [:show, :edit, :update, :destroy]

  # GET /creation_images
  # GET /creation_images.json
  def index
    @creation_images = CreationImage.all
  end

  # GET /creation_images/1
  # GET /creation_images/1.json
  def show
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
    @creation_image = CreationImage.new(creation_image_params)

    respond_to do |format|
      if @creation_image.save
        format.html { redirect_to @creation_image, notice: 'Creation image was successfully created.' }
        format.json { render :show, status: :created, location: @creation_image }
      else
        format.html { render :new }
        format.json { render json: @creation_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creation_images/1
  # PATCH/PUT /creation_images/1.json
  def update
    respond_to do |format|
      if @creation_image.update(creation_image_params)
        format.html { redirect_to @creation_image, notice: 'Creation image was successfully updated.' }
        format.json { render :show, status: :ok, location: @creation_image }
      else
        format.html { render :edit }
        format.json { render json: @creation_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creation_images/1
  # DELETE /creation_images/1.json
  def destroy
    @creation_image.destroy
    respond_to do |format|
      format.html { redirect_to creation_images_url, notice: 'Creation image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creation_image
      @creation_image = CreationImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creation_image_params
      params.require(:creation_image).permit(:creation_id, :image, :image_name_for_user, :order)
    end
end
