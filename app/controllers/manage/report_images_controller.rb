class Manage::ReportImagesController < ApplicationController
  before_action :set_manage_report_image, only: [:show, :edit, :update, :destroy]

  # GET /manage/report_images
  # GET /manage/report_images.json
  def index
    @manage_report_images = ReportImage.all
  end

  # GET /manage/report_images/1
  # GET /manage/report_images/1.json
  def show
  end

  # GET /manage/report_images/new
  def new
    @manage_report_image = ReportImage.new
  end

  # GET /manage/report_images/1/edit
  def edit
  end

  # POST /manage/report_images
  # POST /manage/report_images.json
  def create
    @manage_report_image = ReportImage.new(manage_report_image_params)

    respond_to do |format|
      if @manage_report_image.save
        format.html { redirect_to @manage_report_image, notice: 'Report image was successfully created.' }
        format.json { render :show, status: :created, location: @manage_report_image }
      else
        format.html { render :new }
        format.json { render json: @manage_report_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/report_images/1
  # PATCH/PUT /manage/report_images/1.json
  def update
    respond_to do |format|
      if @manage_report_image.update(manage_report_image_params)
        format.html { redirect_to @manage_report_image, notice: 'Report image was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_report_image }
      else
        format.html { render :edit }
        format.json { render json: @manage_report_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/report_images/1
  # DELETE /manage/report_images/1.json
  def destroy
    @manage_report_image.destroy
    respond_to do |format|
      format.html { redirect_to manage_report_images_url, notice: 'Report image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_report_image
      @manage_report_image = ReportImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_report_image_params
      params.require(:manage_report_image).permit(:report_id, :image)
    end
end
