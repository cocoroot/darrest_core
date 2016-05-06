class Manage::CollectionCreationsController < ApplicationController
  before_action :set_manage_collection_creation, only: [:show, :edit, :update, :destroy]

  # GET /manage/collection_creations
  # GET /manage/collection_creations.json
  def index
    @manage_collection_creations = Manage::CollectionCreation.all
  end

  # GET /manage/collection_creations/1
  # GET /manage/collection_creations/1.json
  def show
  end

  # GET /manage/collection_creations/new
  def new
    @manage_collection_creation = Manage::CollectionCreation.new
  end

  # GET /manage/collection_creations/1/edit
  def edit
  end

  # POST /manage/collection_creations
  # POST /manage/collection_creations.json
  def create
    @manage_collection_creation = Manage::CollectionCreation.new(manage_collection_creation_params)

    respond_to do |format|
      if @manage_collection_creation.save
        format.html { redirect_to @manage_collection_creation, notice: 'Collection creation was successfully created.' }
        format.json { render :show, status: :created, location: @manage_collection_creation }
      else
        format.html { render :new }
        format.json { render json: @manage_collection_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/collection_creations/1
  # PATCH/PUT /manage/collection_creations/1.json
  def update
    respond_to do |format|
      if @manage_collection_creation.update(manage_collection_creation_params)
        format.html { redirect_to @manage_collection_creation, notice: 'Collection creation was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_collection_creation }
      else
        format.html { render :edit }
        format.json { render json: @manage_collection_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/collection_creations/1
  # DELETE /manage/collection_creations/1.json
  def destroy
    @manage_collection_creation.destroy
    respond_to do |format|
      format.html { redirect_to manage_collection_creations_url, notice: 'Collection creation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_collection_creation
      @manage_collection_creation = Manage::CollectionCreation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_collection_creation_params
      params.require(:manage_collection_creation).permit(:collection_id, :creation_id)
    end
end
