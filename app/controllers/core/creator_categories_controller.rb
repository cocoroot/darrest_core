class Core::CreatorCategoriesController < ApplicationController
  before_action :set_core_creator_category, only: [:show, :edit, :update, :destroy]

  # GET /core/creator_categories
  # GET /core/creator_categories.json
  def index
    @core_creator_categories = Core::CreatorCategory.all
  end

  # GET /core/creator_categories/1
  # GET /core/creator_categories/1.json
  def show
  end

  # GET /core/creator_categories/new
  def new
    @core_creator_category = Core::CreatorCategory.new
  end

  # GET /core/creator_categories/1/edit
  def edit
  end

  # POST /core/creator_categories
  # POST /core/creator_categories.json
  def create
    @core_creator_category = Core::CreatorCategory.new(core_creator_category_params)

    respond_to do |format|
      if @core_creator_category.save
        format.html { redirect_to @core_creator_category, notice: 'Creator category was successfully created.' }
        format.json { render :show, status: :created, location: @core_creator_category }
      else
        format.html { render :new }
        format.json { render json: @core_creator_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creator_categories/1
  # PATCH/PUT /core/creator_categories/1.json
  def update
    respond_to do |format|
      if @core_creator_category.update(core_creator_category_params)
        format.html { redirect_to @core_creator_category, notice: 'Creator category was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creator_category }
      else
        format.html { render :edit }
        format.json { render json: @core_creator_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creator_categories/1
  # DELETE /core/creator_categories/1.json
  def destroy
    @core_creator_category.destroy
    respond_to do |format|
      format.html { redirect_to core_creator_categories_url, notice: 'Creator category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creator_category
      @core_creator_category = Core::CreatorCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creator_category_params
      params.require(:core_creator_category).permit(:creator_id, :category_id)
    end
end
