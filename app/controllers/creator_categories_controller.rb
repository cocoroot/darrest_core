class CreatorCategoriesController < ApplicationController
  before_action :set_creator_category, only: [:show, :edit, :update, :destroy]

  # GET /creator_categories
  # GET /creator_categories.json
  def index
    @creator_categories = CreatorCategory.all
  end

  # GET /creator_categories/1
  # GET /creator_categories/1.json
  def show
  end

  # GET /creator_categories/new
  def new
    @creator_category = CreatorCategory.new
  end

  # GET /creator_categories/1/edit
  def edit
  end

  # POST /creator_categories
  # POST /creator_categories.json
  def create
    @creator_category = CreatorCategory.new(creator_category_params)

    respond_to do |format|
      if @creator_category.save
        format.html { redirect_to @creator_category, notice: 'Creator category was successfully created.' }
        format.json { render :show, status: :created, location: @creator_category }
      else
        format.html { render :new }
        format.json { render json: @creator_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creator_categories/1
  # PATCH/PUT /creator_categories/1.json
  def update
    respond_to do |format|
      if @creator_category.update(creator_category_params)
        format.html { redirect_to @creator_category, notice: 'Creator category was successfully updated.' }
        format.json { render :show, status: :ok, location: @creator_category }
      else
        format.html { render :edit }
        format.json { render json: @creator_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creator_categories/1
  # DELETE /creator_categories/1.json
  def destroy
    @creator_category.destroy
    respond_to do |format|
      format.html { redirect_to creator_categories_url, notice: 'Creator category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator_category
      @creator_category = CreatorCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creator_category_params
      params.require(:creator_category).permit(:creator_id, :category_id)
    end
end
