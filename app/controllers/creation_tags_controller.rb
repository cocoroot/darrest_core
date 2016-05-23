class CreationTagsController < ApplicationController
  before_action :set_creation_tag, only: [:show, :edit, :update, :destroy]

  # GET /creation_tags
  # GET /creation_tags.json
  def index
    @creation_tags = CreationTag.all
  end

  # GET /creation_tags/1
  # GET /creation_tags/1.json
  def show
  end

  # GET /creation_tags/new
  def new
    @creation_tag = CreationTag.new
  end

  # GET /creation_tags/1/edit
  def edit
  end

  # POST /creation_tags
  # POST /creation_tags.json
  def create
    @creation_tag = CreationTag.new(creation_tag_params)

    respond_to do |format|
      if @creation_tag.save
        format.html { redirect_to @creation_tag, notice: 'Creation tag was successfully created.' }
        format.json { render :show, status: :created, location: @creation_tag }
      else
        format.html { render :new }
        format.json { render json: @creation_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creation_tags/1
  # PATCH/PUT /creation_tags/1.json
  def update
    respond_to do |format|
      if @creation_tag.update(creation_tag_params)
        format.html { redirect_to @creation_tag, notice: 'Creation tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @creation_tag }
      else
        format.html { render :edit }
        format.json { render json: @creation_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creation_tags/1
  # DELETE /creation_tags/1.json
  def destroy
    @creation_tag.destroy
    respond_to do |format|
      format.html { redirect_to creation_tags_url, notice: 'Creation tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creation_tag
      @creation_tag = CreationTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creation_tag_params
      params.require(:creation_tag).permit(:creation_id, :tag_id)
    end
end
