class Core::TagsController < ApplicationController
  before_action :set_core_tag, only: [:show, :edit, :update, :destroy]

  # GET /core/tags
  # GET /core/tags.json
  def index
    @core_tags = Core::Tag.all
  end

  # GET /core/tags/1
  # GET /core/tags/1.json
  def show
  end

  # GET /core/tags/new
  def new
    @core_tag = Core::Tag.new
  end

  # GET /core/tags/1/edit
  def edit
  end

  # POST /core/tags
  # POST /core/tags.json
  def create
    @core_tag = Core::Tag.new(core_tag_params)

    respond_to do |format|
      if @core_tag.save
        format.html { redirect_to @core_tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @core_tag }
      else
        format.html { render :new }
        format.json { render json: @core_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/tags/1
  # PATCH/PUT /core/tags/1.json
  def update
    respond_to do |format|
      if @core_tag.update(core_tag_params)
        format.html { redirect_to @core_tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_tag }
      else
        format.html { render :edit }
        format.json { render json: @core_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/tags/1
  # DELETE /core/tags/1.json
  def destroy
    @core_tag.destroy
    respond_to do |format|
      format.html { redirect_to core_tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_tag
      @core_tag = Core::Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_tag_params
      params.require(:core_tag).permit(:name)
    end
end
