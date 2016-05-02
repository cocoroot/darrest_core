class CollectionCreationsController < ApplicationController
  before_action :set_collection_creation, only: [:show, :edit, :update, :destroy]

  # GET /collection_creations
  # GET /collection_creations.json
  def index
    @collection_creations = CollectionCreation.all
  end

  # GET /collection_creations/1
  # GET /collection_creations/1.json
  def show
  end

  # GET /collection_creations/new
  def new
    @collection_creation = CollectionCreation.new
  end

  # GET /collection_creations/1/edit
  def edit
  end

  # POST /collection_creations
  # POST /collection_creations.json
  def create
    @collection_creation = CollectionCreation.new(collection_creation_params)

    respond_to do |format|
      if @collection_creation.save
        format.html { redirect_to @collection_creation, notice: 'Collection creation was successfully created.' }
        format.json { render :show, status: :created, location: @collection_creation }
      else
        format.html { render :new }
        format.json { render json: @collection_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_creations/1
  # PATCH/PUT /collection_creations/1.json
  def update
    respond_to do |format|
      if @collection_creation.update(collection_creation_params)
        format.html { redirect_to @collection_creation, notice: 'Collection creation was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_creation }
      else
        format.html { render :edit }
        format.json { render json: @collection_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_creations/1
  # DELETE /collection_creations/1.json
  def destroy
    @collection_creation.destroy
    respond_to do |format|
      format.html { redirect_to collection_creations_url, notice: 'Collection creation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_creation
      @collection_creation = CollectionCreation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_creation_params
      params.require(:collection_creation).permit(:collection_id, :creation_id)
    end
end
