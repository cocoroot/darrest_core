class Manage::UserImagesController < ApplicationController
  before_action :set_manage_user_image, only: [:show, :edit, :update, :destroy]

  # GET /manage/user_images
  # GET /manage/user_images.json
  def index
    @manage_user_images = Manage::UserImage.all
  end

  # GET /manage/user_images/1
  # GET /manage/user_images/1.json
  def show
  end

  # GET /manage/user_images/new
  def new
    @manage_user_image = Manage::UserImage.new
  end

  # GET /manage/user_images/1/edit
  def edit
  end

  # POST /manage/user_images
  # POST /manage/user_images.json
  def create
    @manage_user_image = Manage::UserImage.new(manage_user_image_params)

    respond_to do |format|
      if @manage_user_image.save
        format.html { redirect_to @manage_user_image, notice: 'User image was successfully created.' }
        format.json { render :show, status: :created, location: @manage_user_image }
      else
        format.html { render :new }
        format.json { render json: @manage_user_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/user_images/1
  # PATCH/PUT /manage/user_images/1.json
  def update
    respond_to do |format|
      if @manage_user_image.update(manage_user_image_params)
        format.html { redirect_to @manage_user_image, notice: 'User image was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_user_image }
      else
        format.html { render :edit }
        format.json { render json: @manage_user_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/user_images/1
  # DELETE /manage/user_images/1.json
  def destroy
    @manage_user_image.destroy
    respond_to do |format|
      format.html { redirect_to manage_user_images_url, notice: 'User image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_user_image
      @manage_user_image = Manage::UserImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_user_image_params
      params.require(:manage_user_image).permit(:user_id, :image, :in_user)
    end
end
