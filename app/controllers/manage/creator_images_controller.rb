class Manage::CreatorImagesController < ApplicationController
  before_action :set_manage_creator_image, only: [:show, :edit, :update, :destroy]

  # GET /manage/creator_images
  # GET /manage/creator_images.json
  def index
    @manage_creator_images = Manage::CreatorImage.all
  end

  # GET /manage/creator_images/1
  # GET /manage/creator_images/1.json
  def show
  end

  # GET /manage/creator_images/new
  def new
    @manage_creator_image = Manage::CreatorImage.new
  end

  # GET /manage/creator_images/1/edit
  def edit
  end

  # POST /manage/creator_images
  # POST /manage/creator_images.json
  def create
    @manage_creator_image = Manage::CreatorImage.new(manage_creator_image_params)

    respond_to do |format|
      if @manage_creator_image.save
        format.html { redirect_to @manage_creator_image, notice: 'Creator image was successfully created.' }
        format.json { render :show, status: :created, location: @manage_creator_image }
      else
        format.html { render :new }
        format.json { render json: @manage_creator_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/creator_images/1
  # PATCH/PUT /manage/creator_images/1.json
  def update
    respond_to do |format|
      if @manage_creator_image.update(manage_creator_image_params)
        format.html { redirect_to @manage_creator_image, notice: 'Creator image was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_creator_image }
      else
        format.html { render :edit }
        format.json { render json: @manage_creator_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/creator_images/1
  # DELETE /manage/creator_images/1.json
  def destroy
    @manage_creator_image.destroy
    respond_to do |format|
      format.html { redirect_to manage_creator_images_url, notice: 'Creator image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_creator_image
      @manage_creator_image = Manage::CreatorImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_creator_image_params
      params.require(:manage_creator_image).permit(:creator_id, :image, :in_use)
    end
end
