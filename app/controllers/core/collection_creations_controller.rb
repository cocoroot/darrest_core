class Core::CollectionCreationsController < ApplicationController
  before_action :set_core_collection_creation, only: [:show, :edit, :update, :destroy]

  # GET /core/collection_creations
  # GET /core/collection_creations.json
  def index
    @core_collection_creations = Core::CollectionCreation.all
  end

  # GET /core/collection_creations/1
  # GET /core/collection_creations/1.json
  def show
  end

  # GET /core/collection_creations/new
  def new
    @core_collection_creation = Core::CollectionCreation.new
  end

  # GET /core/collection_creations/1/edit
  def edit
  end

  # POST /core/collection_creations
  # POST /core/collection_creations.json
  def create
    @core_collection_creation = Core::CollectionCreation.new(core_collection_creation_params)

    respond_to do |format|
      if @core_collection_creation.save
        format.html { redirect_to @core_collection_creation, notice: 'Collection creation was successfully created.' }
        format.json { render :show, status: :created, location: @core_collection_creation }
      else
        format.html { render :new }
        format.json { render json: @core_collection_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/collection_creations/1
  # PATCH/PUT /core/collection_creations/1.json
  def update
    respond_to do |format|
      if @core_collection_creation.update(core_collection_creation_params)
        format.html { redirect_to @core_collection_creation, notice: 'Collection creation was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_collection_creation }
      else
        format.html { render :edit }
        format.json { render json: @core_collection_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/collection_creations/1
  # DELETE /core/collection_creations/1.json
  def destroy
    @core_collection_creation.destroy
    respond_to do |format|
      format.html { redirect_to core_collection_creations_url, notice: 'Collection creation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_collection_creation
      @core_collection_creation = Core::CollectionCreation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_collection_creation_params
      params.require(:core_collection_creation).permit(:collection_id, :creation_id)
    end
end
