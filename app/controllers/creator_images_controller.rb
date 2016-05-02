class CreatorImagesController < ApplicationController
  before_action :set_creator_image, only: [:show, :edit, :update, :destroy]

  # GET /creator_images
  # GET /creator_images.json
  def index
    @creator_images = CreatorImage.all
  end

  # GET /creator_images/1
  # GET /creator_images/1.json
  def show
  end

  # GET /creator_images/new
  def new
    @creator_image = CreatorImage.new
  end

  # GET /creator_images/1/edit
  def edit
  end

  # POST /creator_images
  # POST /creator_images.json
  def create
    @creator_image = CreatorImage.new(creator_image_params)

    respond_to do |format|
      if @creator_image.save
        format.html { redirect_to @creator_image, notice: 'Creator image was successfully created.' }
        format.json { render :show, status: :created, location: @creator_image }
      else
        format.html { render :new }
        format.json { render json: @creator_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creator_images/1
  # PATCH/PUT /creator_images/1.json
  def update
    respond_to do |format|
      if @creator_image.update(creator_image_params)
        format.html { redirect_to @creator_image, notice: 'Creator image was successfully updated.' }
        format.json { render :show, status: :ok, location: @creator_image }
      else
        format.html { render :edit }
        format.json { render json: @creator_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creator_images/1
  # DELETE /creator_images/1.json
  def destroy
    @creator_image.destroy
    respond_to do |format|
      format.html { redirect_to creator_images_url, notice: 'Creator image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator_image
      @creator_image = CreatorImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creator_image_params
      params.require(:creator_image).permit(:creator_id, :image, :in_use)
    end
end
