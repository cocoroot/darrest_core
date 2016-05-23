class CreationStatusesController < ApplicationController
  before_action :set_creation_status, only: [:show, :edit, :update, :destroy]

  # GET /creation_statuses
  # GET /creation_statuses.json
  def index
    @creation_statuses = CreationStatus.all
  end

  # GET /creation_statuses/1
  # GET /creation_statuses/1.json
  def show
  end

  # GET /creation_statuses/new
  def new
    @creation_status = CreationStatus.new
  end

  # GET /creation_statuses/1/edit
  def edit
  end

  # POST /creation_statuses
  # POST /creation_statuses.json
  def create
    @creation_status = CreationStatus.new(creation_status_params)

    respond_to do |format|
      if @creation_status.save
        format.html { redirect_to @creation_status, notice: 'Creation status was successfully created.' }
        format.json { render :show, status: :created, location: @creation_status }
      else
        format.html { render :new }
        format.json { render json: @creation_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creation_statuses/1
  # PATCH/PUT /creation_statuses/1.json
  def update
    respond_to do |format|
      if @creation_status.update(creation_status_params)
        format.html { redirect_to @creation_status, notice: 'Creation status was successfully updated.' }
        format.json { render :show, status: :ok, location: @creation_status }
      else
        format.html { render :edit }
        format.json { render json: @creation_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creation_statuses/1
  # DELETE /creation_statuses/1.json
  def destroy
    @creation_status.destroy
    respond_to do |format|
      format.html { redirect_to creation_statuses_url, notice: 'Creation status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creation_status
      @creation_status = CreationStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creation_status_params
      params.require(:creation_status).permit(:name)
    end
end
