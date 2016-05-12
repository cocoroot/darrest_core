class Core::CreatorTagsController < ApplicationController
  before_action :set_core_creator_tag, only: [:show, :edit, :update, :destroy]

  # GET /core/creator_tags
  # GET /core/creator_tags.json
  def index
    @core_creator_tags = Core::CreatorTag.all
  end

  # GET /core/creator_tags/1
  # GET /core/creator_tags/1.json
  def show
  end

  # GET /core/creator_tags/new
  def new
    @core_creator_tag = Core::CreatorTag.new
  end

  # GET /core/creator_tags/1/edit
  def edit
  end

  # POST /core/creator_tags
  # POST /core/creator_tags.json
  def create
    @core_creator_tag = Core::CreatorTag.new(core_creator_tag_params)

    respond_to do |format|
      if @core_creator_tag.save
        format.html { redirect_to @core_creator_tag, notice: 'Creator tag was successfully created.' }
        format.json { render :show, status: :created, location: @core_creator_tag }
      else
        format.html { render :new }
        format.json { render json: @core_creator_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creator_tags/1
  # PATCH/PUT /core/creator_tags/1.json
  def update
    respond_to do |format|
      if @core_creator_tag.update(core_creator_tag_params)
        format.html { redirect_to @core_creator_tag, notice: 'Creator tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creator_tag }
      else
        format.html { render :edit }
        format.json { render json: @core_creator_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creator_tags/1
  # DELETE /core/creator_tags/1.json
  def destroy
    @core_creator_tag.destroy
    respond_to do |format|
      format.html { redirect_to core_creator_tags_url, notice: 'Creator tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creator_tag
      @core_creator_tag = Core::CreatorTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creator_tag_params
      params.require(:core_creator_tag).permit(:creator_id, :tag_id)
    end
end
