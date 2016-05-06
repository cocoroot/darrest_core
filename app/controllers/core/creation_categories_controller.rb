class Core::CreationCategoriesController < ApplicationController
  before_action :set_core_creation_category, only: [:show, :edit, :update, :destroy]

  # GET /core/creation_categories
  # GET /core/creation_categories.json
  def index
    @core_creation_categories = Core::CreationCategory.all
  end

  # GET /core/creation_categories/1
  # GET /core/creation_categories/1.json
  def show
  end

  # GET /core/creation_categories/new
  def new
    @core_creation_category = Core::CreationCategory.new
  end

  # GET /core/creation_categories/1/edit
  def edit
  end

  # POST /core/creation_categories
  # POST /core/creation_categories.json
  def create
    @core_creation_category = Core::CreationCategory.new(core_creation_category_params)

    respond_to do |format|
      if @core_creation_category.save
        format.html { redirect_to @core_creation_category, notice: 'Creation category was successfully created.' }
        format.json { render :show, status: :created, location: @core_creation_category }
      else
        format.html { render :new }
        format.json { render json: @core_creation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creation_categories/1
  # PATCH/PUT /core/creation_categories/1.json
  def update
    respond_to do |format|
      if @core_creation_category.update(core_creation_category_params)
        format.html { redirect_to @core_creation_category, notice: 'Creation category was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creation_category }
      else
        format.html { render :edit }
        format.json { render json: @core_creation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creation_categories/1
  # DELETE /core/creation_categories/1.json
  def destroy
    @core_creation_category.destroy
    respond_to do |format|
      format.html { redirect_to core_creation_categories_url, notice: 'Creation category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creation_category
      @core_creation_category = Core::CreationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creation_category_params
      params.require(:core_creation_category).permit(:creation_id, :category_id)
    end
end
