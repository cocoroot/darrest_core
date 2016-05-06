class Manage::CreatorTagsController < ApplicationController
  before_action :set_manage_creator_tag, only: [:show, :edit, :update, :destroy]

  # GET /manage/creator_tags
  # GET /manage/creator_tags.json
  def index
    @manage_creator_tags = CreatorTag.all
  end

  # GET /manage/creator_tags/1
  # GET /manage/creator_tags/1.json
  def show
  end

  # GET /manage/creator_tags/new
  def new
    @manage_creator_tag = CreatorTag.new
  end

  # GET /manage/creator_tags/1/edit
  def edit
  end

  # POST /manage/creator_tags
  # POST /manage/creator_tags.json
  def create
    @manage_creator_tag = CreatorTag.new(manage_creator_tag_params)

    respond_to do |format|
      if @manage_creator_tag.save
        format.html { redirect_to @manage_creator_tag, notice: 'Creator tag was successfully created.' }
        format.json { render :show, status: :created, location: @manage_creator_tag }
      else
        format.html { render :new }
        format.json { render json: @manage_creator_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/creator_tags/1
  # PATCH/PUT /manage/creator_tags/1.json
  def update
    respond_to do |format|
      if @manage_creator_tag.update(manage_creator_tag_params)
        format.html { redirect_to @manage_creator_tag, notice: 'Creator tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_creator_tag }
      else
        format.html { render :edit }
        format.json { render json: @manage_creator_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/creator_tags/1
  # DELETE /manage/creator_tags/1.json
  def destroy
    @manage_creator_tag.destroy
    respond_to do |format|
      format.html { redirect_to manage_creator_tags_url, notice: 'Creator tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_creator_tag
      @manage_creator_tag = CreatorTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_creator_tag_params
      params.require(:manage_creator_tag).permit(:creator_id, :tag_id)
    end
end
