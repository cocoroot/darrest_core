class Core::CreationImagesController < ApplicationController
  before_action :set_core_creation_image, only: [:show, :edit, :update, :destroy]

  # GET /core/creation_images
  # GET /core/creation_images.json
  def index
    @core_creation_images = Core::CreationImage.all
  end

  # GET /core/creation_images/1
  # GET /core/creation_images/1.json
  def show
  end

  # GET /core/creation_images/new
  def new
    @core_creation_image = Core::CreationImage.new
  end

  # GET /core/creation_images/1/edit
  def edit
  end

  # POST /core/creation_images
  # POST /core/creation_images.json
  def create
    @core_creation_image = Core::CreationImage.new(core_creation_image_params)

    respond_to do |format|
      if @core_creation_image.save
        format.html { redirect_to @core_creation_image, notice: 'Creation image was successfully created.' }
        format.json { render :show, status: :created, location: @core_creation_image }
      else
        format.html { render :new }
        format.json { render json: @core_creation_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creation_images/1
  # PATCH/PUT /core/creation_images/1.json
  def update
    respond_to do |format|
      if @core_creation_image.update(core_creation_image_params)
        format.html { redirect_to @core_creation_image, notice: 'Creation image was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creation_image }
      else
        format.html { render :edit }
        format.json { render json: @core_creation_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creation_images/1
  # DELETE /core/creation_images/1.json
  def destroy
    @core_creation_image.destroy
    respond_to do |format|
      format.html { redirect_to core_creation_images_url, notice: 'Creation image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creation_image
      @core_creation_image = Core::CreationImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creation_image_params
      params.require(:core_creation_image).permit(:creation_id, :image)
    end
end
