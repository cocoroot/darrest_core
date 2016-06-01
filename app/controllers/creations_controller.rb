class CreationsController < ApplicationController
  # before_action :set_creation, only: [:show, :edit, :update, :destroy]

  # GET /creations
  # GET /creations.json
  def index
    @creations = Creation.all
  end

  # GET /creations/1
  # GET /creations/1.json
  def show
    @result = LoadCreationLogic.new.execute(params_for_show)
  end

  # GET /creations/new
  def new
    @creation = Creation.new
  end

  # GET /creations/1/edit
  def edit
  end

  # POST /creations
  # POST /creations.json
  def create
    @result = CreateCreationLogic.new.execute(params_for_create)

    respond_to do |format|
      format.html { redirect_to @result[:creation], notice: 'Creation was successfully created.' }
      format.json { render :show, status: :created, location: @result[:creation] }
    end
  end

  # PATCH/PUT /creations/1
  # PATCH/PUT /creations/1.json
  def update
    @result = UpdateCreationLogic.new.execute(params_for_update)
    
    respond_to do |format|
      format.html { redirect_to @result[:creation], notice: 'Creation was successfully updated.' }
      format.json { render :show, status: :ok, location: @result[:creation] }
    end
  end

  # DELETE /creations/1
  # DELETE /creations/1.json
  def destroy
    @creation.destroy
    respond_to do |format|
      format.html { redirect_to creations_url, notice: 'Creation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_creation
    @creation = Creation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def params_for_create
    {
      site_id: site_id,
      creation: params.require(:creation).permit(:site_user_id, :title, :description)
    }
  end

  def params_for_show
    {
      site_id: site_id,
      id: params[:id]
    }
  end

  def params_for_update
    {
      site_id: site_id,
      creation: params.require(:creation).permit(:title, :description, :creation_status_id).merge(id: params[:id])
    }
  end
end
