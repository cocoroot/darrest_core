class Manage::CategoriesController < ApplicationController
  before_action :set_manage_category, only: [:show, :edit, :update, :destroy]

  # GET /manage/categories
  # GET /manage/categories.json
  def index
    @manage_categories = Category.all
  end

  # GET /manage/categories/1
  # GET /manage/categories/1.json
  def show
  end

  # GET /manage/categories/new
  def new
    @manage_category = Category.new
  end

  # GET /manage/categories/1/edit
  def edit
  end

  # POST /manage/categories
  # POST /manage/categories.json
  def create
    @manage_category = Category.new(manage_category_params)

    respond_to do |format|
      if @manage_category.save
        format.html { redirect_to @manage_category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @manage_category }
      else
        format.html { render :new }
        format.json { render json: @manage_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/categories/1
  # PATCH/PUT /manage/categories/1.json
  def update
    respond_to do |format|
      if @manage_category.update(manage_category_params)
        format.html { redirect_to @manage_category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_category }
      else
        format.html { render :edit }
        format.json { render json: @manage_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/categories/1
  # DELETE /manage/categories/1.json
  def destroy
    @manage_category.destroy
    respond_to do |format|
      format.html { redirect_to manage_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_category
      @manage_category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_category_params
      params.require(:manage_category).permit(:name, :parent_id)
    end
end
