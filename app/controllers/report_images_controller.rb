class ReportImagesController < ApplicationController
  before_action :set_report_image, only: [:show, :edit, :update, :destroy]

  # GET /report_images
  # GET /report_images.json
  def index
    @report_images = ReportImage.all
  end

  # GET /report_images/1
  # GET /report_images/1.json
  def show
  end

  # GET /report_images/new
  def new
    @report_image = ReportImage.new
  end

  # GET /report_images/1/edit
  def edit
  end

  # POST /report_images
  # POST /report_images.json
  def create
    @report_image = ReportImage.new(report_image_params)

    respond_to do |format|
      if @report_image.save
        format.html { redirect_to @report_image, notice: 'Report image was successfully created.' }
        format.json { render :show, status: :created, location: @report_image }
      else
        format.html { render :new }
        format.json { render json: @report_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_images/1
  # PATCH/PUT /report_images/1.json
  def update
    respond_to do |format|
      if @report_image.update(report_image_params)
        format.html { redirect_to @report_image, notice: 'Report image was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_image }
      else
        format.html { render :edit }
        format.json { render json: @report_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_images/1
  # DELETE /report_images/1.json
  def destroy
    @report_image.destroy
    respond_to do |format|
      format.html { redirect_to report_images_url, notice: 'Report image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_image
      @report_image = ReportImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_image_params
      params.require(:report_image).permit(:report_id, :image, :order)
    end
end
