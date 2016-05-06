class Manage::CollectionsController < ApplicationController
  before_action :set_manage_collection, only: [:show, :edit, :update, :destroy]

  # GET /manage/collections
  # GET /manage/collections.json
  def index
    @manage_collections = Manage::Collection.all
  end

  # GET /manage/collections/1
  # GET /manage/collections/1.json
  def show
  end

  # GET /manage/collections/new
  def new
    @manage_collection = Manage::Collection.new
  end

  # GET /manage/collections/1/edit
  def edit
  end

  # POST /manage/collections
  # POST /manage/collections.json
  def create
    @manage_collection = Manage::Collection.new(manage_collection_params)

    respond_to do |format|
      if @manage_collection.save
        format.html { redirect_to @manage_collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @manage_collection }
      else
        format.html { render :new }
        format.json { render json: @manage_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/collections/1
  # PATCH/PUT /manage/collections/1.json
  def update
    respond_to do |format|
      if @manage_collection.update(manage_collection_params)
        format.html { redirect_to @manage_collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_collection }
      else
        format.html { render :edit }
        format.json { render json: @manage_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/collections/1
  # DELETE /manage/collections/1.json
  def destroy
    @manage_collection.destroy
    respond_to do |format|
      format.html { redirect_to manage_collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_collection
      @manage_collection = Manage::Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_collection_params
      params.require(:manage_collection).permit(:sid, :user_id, :title)
    end
end
