class Core::CollectionsController < ApplicationController
  before_action :set_core_collection, only: [:show, :edit, :update, :destroy]

  # GET /core/collections
  # GET /core/collections.json
  def index
    @core_collections = Core::Collection.all
  end

  # GET /core/collections/1
  # GET /core/collections/1.json
  def show
  end

  # GET /core/collections/new
  def new
    @core_collection = Core::Collection.new
  end

  # GET /core/collections/1/edit
  def edit
  end

  # POST /core/collections
  # POST /core/collections.json
  def create
    @core_collection = Core::Collection.new(core_collection_params)

    respond_to do |format|
      if @core_collection.save
        format.html { redirect_to @core_collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @core_collection }
      else
        format.html { render :new }
        format.json { render json: @core_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/collections/1
  # PATCH/PUT /core/collections/1.json
  def update
    respond_to do |format|
      if @core_collection.update(core_collection_params)
        format.html { redirect_to @core_collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_collection }
      else
        format.html { render :edit }
        format.json { render json: @core_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/collections/1
  # DELETE /core/collections/1.json
  def destroy
    @core_collection.destroy
    respond_to do |format|
      format.html { redirect_to core_collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_collection
      @core_collection = Core::Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_collection_params
      params.require(:core_collection).permit(:sid, :user_id, :title)
    end
end
