class Manage::CreationTagsController < ApplicationController
  before_action :set_manage_creation_tag, only: [:show, :edit, :update, :destroy]

  # GET /manage/creation_tags
  # GET /manage/creation_tags.json
  def index
    @manage_creation_tags = CreationTag.all
  end

  # GET /manage/creation_tags/1
  # GET /manage/creation_tags/1.json
  def show
  end

  # GET /manage/creation_tags/new
  def new
    @manage_creation_tag = CreationTag.new
  end

  # GET /manage/creation_tags/1/edit
  def edit
  end

  # POST /manage/creation_tags
  # POST /manage/creation_tags.json
  def create
    @manage_creation_tag = CreationTag.new(manage_creation_tag_params)

    respond_to do |format|
      if @manage_creation_tag.save
        format.html { redirect_to @manage_creation_tag, notice: 'Creation tag was successfully created.' }
        format.json { render :show, status: :created, location: @manage_creation_tag }
      else
        format.html { render :new }
        format.json { render json: @manage_creation_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/creation_tags/1
  # PATCH/PUT /manage/creation_tags/1.json
  def update
    respond_to do |format|
      if @manage_creation_tag.update(manage_creation_tag_params)
        format.html { redirect_to @manage_creation_tag, notice: 'Creation tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_creation_tag }
      else
        format.html { render :edit }
        format.json { render json: @manage_creation_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/creation_tags/1
  # DELETE /manage/creation_tags/1.json
  def destroy
    @manage_creation_tag.destroy
    respond_to do |format|
      format.html { redirect_to manage_creation_tags_url, notice: 'Creation tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_creation_tag
      @manage_creation_tag = CreationTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_creation_tag_params
      params.require(:manage_creation_tag).permit(:creation_id, :references)
    end
end
