class Core::UserImagesController < ApplicationController
  before_action :set_core_user_image, only: [:show, :edit, :update, :destroy]

  # GET /core/user_images
  # GET /core/user_images.json
  def index
    @core_user_images = Core::UserImage.all
  end

  # GET /core/user_images/1
  # GET /core/user_images/1.json
  def show
  end

  # GET /core/user_images/new
  def new
    @core_user_image = Core::UserImage.new
  end

  # GET /core/user_images/1/edit
  def edit
  end

  # POST /core/user_images
  # POST /core/user_images.json
  def create
    @core_user_image = Core::UserImage.new(core_user_image_params)

    respond_to do |format|
      if @core_user_image.save
        format.html { redirect_to @core_user_image, notice: 'User image was successfully created.' }
        format.json { render :show, status: :created, location: @core_user_image }
      else
        format.html { render :new }
        format.json { render json: @core_user_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/user_images/1
  # PATCH/PUT /core/user_images/1.json
  def update
    respond_to do |format|
      if @core_user_image.update(core_user_image_params)
        format.html { redirect_to @core_user_image, notice: 'User image was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_user_image }
      else
        format.html { render :edit }
        format.json { render json: @core_user_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/user_images/1
  # DELETE /core/user_images/1.json
  def destroy
    @core_user_image.destroy
    respond_to do |format|
      format.html { redirect_to core_user_images_url, notice: 'User image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_user_image
      @core_user_image = Core::UserImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_user_image_params
      params.require(:core_user_image).permit(:user_id, :image, :in_use)
    end
end
