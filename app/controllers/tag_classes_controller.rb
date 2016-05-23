class TagClassesController < ApplicationController
  before_action :set_tag_class, only: [:show, :edit, :update, :destroy]

  # GET /tag_classes
  # GET /tag_classes.json
  def index
    @tag_classes = TagClass.all
  end

  # GET /tag_classes/1
  # GET /tag_classes/1.json
  def show
  end

  # GET /tag_classes/new
  def new
    @tag_class = TagClass.new
  end

  # GET /tag_classes/1/edit
  def edit
  end

  # POST /tag_classes
  # POST /tag_classes.json
  def create
    @tag_class = TagClass.new(tag_class_params)

    respond_to do |format|
      if @tag_class.save
        format.html { redirect_to @tag_class, notice: 'Tag class was successfully created.' }
        format.json { render :show, status: :created, location: @tag_class }
      else
        format.html { render :new }
        format.json { render json: @tag_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_classes/1
  # PATCH/PUT /tag_classes/1.json
  def update
    respond_to do |format|
      if @tag_class.update(tag_class_params)
        format.html { redirect_to @tag_class, notice: 'Tag class was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_class }
      else
        format.html { render :edit }
        format.json { render json: @tag_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_classes/1
  # DELETE /tag_classes/1.json
  def destroy
    @tag_class.destroy
    respond_to do |format|
      format.html { redirect_to tag_classes_url, notice: 'Tag class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_class
      @tag_class = TagClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_class_params
      params.require(:tag_class).permit(:name)
    end
end
