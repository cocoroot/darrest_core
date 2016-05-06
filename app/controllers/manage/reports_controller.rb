class Manage::ReportsController < ApplicationController
  before_action :set_manage_report, only: [:show, :edit, :update, :destroy]

  # GET /manage/reports
  # GET /manage/reports.json
  def index
    @manage_reports = Report.all
  end

  # GET /manage/reports/1
  # GET /manage/reports/1.json
  def show
  end

  # GET /manage/reports/new
  def new
    @manage_report = Report.new
  end

  # GET /manage/reports/1/edit
  def edit
  end

  # POST /manage/reports
  # POST /manage/reports.json
  def create
    @manage_report = Report.new(manage_report_params)

    respond_to do |format|
      if @manage_report.save
        format.html { redirect_to @manage_report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @manage_report }
      else
        format.html { render :new }
        format.json { render json: @manage_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/reports/1
  # PATCH/PUT /manage/reports/1.json
  def update
    respond_to do |format|
      if @manage_report.update(manage_report_params)
        format.html { redirect_to @manage_report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_report }
      else
        format.html { render :edit }
        format.json { render json: @manage_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/reports/1
  # DELETE /manage/reports/1.json
  def destroy
    @manage_report.destroy
    respond_to do |format|
      format.html { redirect_to manage_reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_report
      @manage_report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_report_params
      params.require(:manage_report).permit(:creation_id, :user_id, :title, :detail)
    end
end
