class Core::CreatorImagesController < ApplicationController
  before_action :set_core_creator_image, only: [:show, :edit, :update, :destroy]

  # GET /core/creator_images
  # GET /core/creator_images.json
  def index
    @core_creator_images = Core::CreatorImage.all
  end

  # GET /core/creator_images/1
  # GET /core/creator_images/1.json
  def show
  end

  # GET /core/creator_images/new
  def new
    @core_creator_image = Core::CreatorImage.new
  end

  # GET /core/creator_images/1/edit
  def edit
  end

  # POST /core/creator_images
  # POST /core/creator_images.json
  def create
    @core_creator_image = Core::CreatorImage.new(core_creator_image_params)

    respond_to do |format|
      if @core_creator_image.save
        format.html { redirect_to @core_creator_image, notice: 'Creator image was successfully created.' }
        format.json { render :show, status: :created, location: @core_creator_image }
      else
        format.html { render :new }
        format.json { render json: @core_creator_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creator_images/1
  # PATCH/PUT /core/creator_images/1.json
  def update
    respond_to do |format|
      if @core_creator_image.update(core_creator_image_params)
        format.html { redirect_to @core_creator_image, notice: 'Creator image was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creator_image }
      else
        format.html { render :edit }
        format.json { render json: @core_creator_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creator_images/1
  # DELETE /core/creator_images/1.json
  def destroy
    @core_creator_image.destroy
    respond_to do |format|
      format.html { redirect_to core_creator_images_url, notice: 'Creator image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creator_image
      @core_creator_image = Core::CreatorImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creator_image_params
      params.require(:core_creator_image).permit(:creator_id, :image, :in_use)
    end
end
