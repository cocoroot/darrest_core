class Core::CreationsController < ApplicationController
  before_action :set_core_creation, only: [:show, :edit, :update, :destroy]

  # GET /core/creations
  # GET /core/creations.json
  def index
    @core_creations = Core::Creation.all
  end

  # GET /core/creations/1
  # GET /core/creations/1.json
  def show
  end

  # GET /core/creations/new
  def new
    @core_creation = Core::Creation.new
  end

  # GET /core/creations/1/edit
  def edit
  end

  # POST /core/creations
  # POST /core/creations.json
  def create
    @core_creation = Core::Creation.new(core_creation_params)

    respond_to do |format|
      if @core_creation.save
        format.html { redirect_to @core_creation, notice: 'Creation was successfully created.' }
        format.json { render :show, status: :created, location: @core_creation }
      else
        format.html { render :new }
        format.json { render json: @core_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creations/1
  # PATCH/PUT /core/creations/1.json
  def update
    respond_to do |format|
      if @core_creation.update(core_creation_params)
        format.html { redirect_to @core_creation, notice: 'Creation was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creation }
      else
        format.html { render :edit }
        format.json { render json: @core_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creations/1
  # DELETE /core/creations/1.json
  def destroy
    @core_creation.destroy
    respond_to do |format|
      format.html { redirect_to core_creations_url, notice: 'Creation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creation
      @core_creation = Core::Creation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creation_params
      params.require(:core_creation).permit(:sid, :creator_id, :title, :description, :license_code)
    end
end
