class CreationCategoriesController < ApplicationController
  before_action :set_creation_category, only: [:show, :edit, :update, :destroy]

  # GET /creation_categories
  # GET /creation_categories.json
  def index
    @creation_categories = CreationCategory.all
  end

  # GET /creation_categories/1
  # GET /creation_categories/1.json
  def show
  end

  # GET /creation_categories/new
  def new
    @creation_category = CreationCategory.new
  end

  # GET /creation_categories/1/edit
  def edit
  end

  # POST /creation_categories
  # POST /creation_categories.json
  def create
    @creation_category = CreationCategory.new(creation_category_params)

    respond_to do |format|
      if @creation_category.save
        format.html { redirect_to @creation_category, notice: 'Creation category was successfully created.' }
        format.json { render :show, status: :created, location: @creation_category }
      else
        format.html { render :new }
        format.json { render json: @creation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creation_categories/1
  # PATCH/PUT /creation_categories/1.json
  def update
    respond_to do |format|
      if @creation_category.update(creation_category_params)
        format.html { redirect_to @creation_category, notice: 'Creation category was successfully updated.' }
        format.json { render :show, status: :ok, location: @creation_category }
      else
        format.html { render :edit }
        format.json { render json: @creation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creation_categories/1
  # DELETE /creation_categories/1.json
  def destroy
    @creation_category.destroy
    respond_to do |format|
      format.html { redirect_to creation_categories_url, notice: 'Creation category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creation_category
      @creation_category = CreationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creation_category_params
      params.require(:creation_category).permit(:creation_id, :category_id)
    end
end
