class Core::CategoriesController < ApplicationController
  before_action :set_core_category, only: [:show, :edit, :update, :destroy]

  # GET /core/categories
  # GET /core/categories.json
  def index
    @core_categories = Core::Category.all
  end

  # GET /core/categories/1
  # GET /core/categories/1.json
  def show
  end

  # GET /core/categories/new
  def new
    @core_category = Core::Category.new
  end

  # GET /core/categories/1/edit
  def edit
  end

  # POST /core/categories
  # POST /core/categories.json
  def create
    @core_category = Core::Category.new(core_category_params)

    respond_to do |format|
      if @core_category.save
        format.html { redirect_to @core_category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @core_category }
      else
        format.html { render :new }
        format.json { render json: @core_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/categories/1
  # PATCH/PUT /core/categories/1.json
  def update
    respond_to do |format|
      if @core_category.update(core_category_params)
        format.html { redirect_to @core_category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_category }
      else
        format.html { render :edit }
        format.json { render json: @core_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/categories/1
  # DELETE /core/categories/1.json
  def destroy
    @core_category.destroy
    respond_to do |format|
      format.html { redirect_to core_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_category
      @core_category = Core::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_category_params
      params.require(:core_category).permit(:name, :parent_id)
    end
end
