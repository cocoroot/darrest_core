class Manage::CreatorCategoriesController < ApplicationController
  before_action :set_manage_creator_category, only: [:show, :edit, :update, :destroy]

  # GET /manage/creator_categories
  # GET /manage/creator_categories.json
  def index
    @manage_creator_categories = CreatorCategory.all
  end

  # GET /manage/creator_categories/1
  # GET /manage/creator_categories/1.json
  def show
  end

  # GET /manage/creator_categories/new
  def new
    @manage_creator_category = CreatorCategory.new
  end

  # GET /manage/creator_categories/1/edit
  def edit
  end

  # POST /manage/creator_categories
  # POST /manage/creator_categories.json
  def create
    @manage_creator_category = CreatorCategory.new(manage_creator_category_params)

    respond_to do |format|
      if @manage_creator_category.save
        format.html { redirect_to @manage_creator_category, notice: 'Creator category was successfully created.' }
        format.json { render :show, status: :created, location: @manage_creator_category }
      else
        format.html { render :new }
        format.json { render json: @manage_creator_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/creator_categories/1
  # PATCH/PUT /manage/creator_categories/1.json
  def update
    respond_to do |format|
      if @manage_creator_category.update(manage_creator_category_params)
        format.html { redirect_to @manage_creator_category, notice: 'Creator category was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_creator_category }
      else
        format.html { render :edit }
        format.json { render json: @manage_creator_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/creator_categories/1
  # DELETE /manage/creator_categories/1.json
  def destroy
    @manage_creator_category.destroy
    respond_to do |format|
      format.html { redirect_to manage_creator_categories_url, notice: 'Creator category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_creator_category
      @manage_creator_category = CreatorCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_creator_category_params
      params.require(:manage_creator_category).permit(:creator_id, :category_id)
    end
end
