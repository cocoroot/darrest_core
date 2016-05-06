class Core::CreationTagsController < ApplicationController
  before_action :set_core_creation_tag, only: [:show, :edit, :update, :destroy]

  # GET /core/creation_tags
  # GET /core/creation_tags.json
  def index
    @core_creation_tags = Core::CreationTag.all
  end

  # GET /core/creation_tags/1
  # GET /core/creation_tags/1.json
  def show
  end

  # GET /core/creation_tags/new
  def new
    @core_creation_tag = Core::CreationTag.new
  end

  # GET /core/creation_tags/1/edit
  def edit
  end

  # POST /core/creation_tags
  # POST /core/creation_tags.json
  def create
    @core_creation_tag = Core::CreationTag.new(core_creation_tag_params)

    respond_to do |format|
      if @core_creation_tag.save
        format.html { redirect_to @core_creation_tag, notice: 'Creation tag was successfully created.' }
        format.json { render :show, status: :created, location: @core_creation_tag }
      else
        format.html { render :new }
        format.json { render json: @core_creation_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creation_tags/1
  # PATCH/PUT /core/creation_tags/1.json
  def update
    respond_to do |format|
      if @core_creation_tag.update(core_creation_tag_params)
        format.html { redirect_to @core_creation_tag, notice: 'Creation tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creation_tag }
      else
        format.html { render :edit }
        format.json { render json: @core_creation_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creation_tags/1
  # DELETE /core/creation_tags/1.json
  def destroy
    @core_creation_tag.destroy
    respond_to do |format|
      format.html { redirect_to core_creation_tags_url, notice: 'Creation tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creation_tag
      @core_creation_tag = Core::CreationTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creation_tag_params
      params.require(:core_creation_tag).permit(:creation_id, :tag_id)
    end
end
