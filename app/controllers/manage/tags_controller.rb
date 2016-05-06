class Manage::TagsController < ApplicationController
  before_action :set_manage_tag, only: [:show, :edit, :update, :destroy]

  # GET /manage/tags
  # GET /manage/tags.json
  def index
    @manage_tags = Manage::Tag.all
  end

  # GET /manage/tags/1
  # GET /manage/tags/1.json
  def show
  end

  # GET /manage/tags/new
  def new
    @manage_tag = Manage::Tag.new
  end

  # GET /manage/tags/1/edit
  def edit
  end

  # POST /manage/tags
  # POST /manage/tags.json
  def create
    @manage_tag = Manage::Tag.new(manage_tag_params)

    respond_to do |format|
      if @manage_tag.save
        format.html { redirect_to @manage_tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @manage_tag }
      else
        format.html { render :new }
        format.json { render json: @manage_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/tags/1
  # PATCH/PUT /manage/tags/1.json
  def update
    respond_to do |format|
      if @manage_tag.update(manage_tag_params)
        format.html { redirect_to @manage_tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_tag }
      else
        format.html { render :edit }
        format.json { render json: @manage_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/tags/1
  # DELETE /manage/tags/1.json
  def destroy
    @manage_tag.destroy
    respond_to do |format|
      format.html { redirect_to manage_tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_tag
      @manage_tag = Manage::Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_tag_params
      params.require(:manage_tag).permit(:name)
    end
end
