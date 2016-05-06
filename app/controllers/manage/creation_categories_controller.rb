class Manage::CreationCategoriesController < ApplicationController
  before_action :set_manage_creation_category, only: [:show, :edit, :update, :destroy]

  # GET /manage/creation_categories
  # GET /manage/creation_categories.json
  def index
    @manage_creation_categories = CreationCategory.all
  end

  # GET /manage/creation_categories/1
  # GET /manage/creation_categories/1.json
  def show
  end

  # GET /manage/creation_categories/new
  def new
    @manage_creation_category = CreationCategory.new
  end

  # GET /manage/creation_categories/1/edit
  def edit
  end

  # POST /manage/creation_categories
  # POST /manage/creation_categories.json
  def create
    @manage_creation_category = CreationCategory.new(manage_creation_category_params)

    respond_to do |format|
      if @manage_creation_category.save
        format.html { redirect_to @manage_creation_category, notice: 'Creation category was successfully created.' }
        format.json { render :show, status: :created, location: @manage_creation_category }
      else
        format.html { render :new }
        format.json { render json: @manage_creation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/creation_categories/1
  # PATCH/PUT /manage/creation_categories/1.json
  def update
    respond_to do |format|
      if @manage_creation_category.update(manage_creation_category_params)
        format.html { redirect_to @manage_creation_category, notice: 'Creation category was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_creation_category }
      else
        format.html { render :edit }
        format.json { render json: @manage_creation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/creation_categories/1
  # DELETE /manage/creation_categories/1.json
  def destroy
    @manage_creation_category.destroy
    respond_to do |format|
      format.html { redirect_to manage_creation_categories_url, notice: 'Creation category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_creation_category
      @manage_creation_category = CreationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_creation_category_params
      params.require(:manage_creation_category).permit(:creation_id, :category_id)
    end
end
