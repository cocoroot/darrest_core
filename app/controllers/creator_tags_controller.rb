class CreatorTagsController < ApplicationController
  before_action :set_creator_tag, only: [:show, :edit, :update, :destroy]

  # GET /creator_tags
  # GET /creator_tags.json
  def index
    @creator_tags = CreatorTag.all
  end

  # GET /creator_tags/1
  # GET /creator_tags/1.json
  def show
  end

  # GET /creator_tags/new
  def new
    @creator_tag = CreatorTag.new
  end

  # GET /creator_tags/1/edit
  def edit
  end

  # POST /creator_tags
  # POST /creator_tags.json
  def create
    @creator_tag = CreatorTag.new(creator_tag_params)

    respond_to do |format|
      if @creator_tag.save
        format.html { redirect_to @creator_tag, notice: 'Creator tag was successfully created.' }
        format.json { render :show, status: :created, location: @creator_tag }
      else
        format.html { render :new }
        format.json { render json: @creator_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creator_tags/1
  # PATCH/PUT /creator_tags/1.json
  def update
    respond_to do |format|
      if @creator_tag.update(creator_tag_params)
        format.html { redirect_to @creator_tag, notice: 'Creator tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @creator_tag }
      else
        format.html { render :edit }
        format.json { render json: @creator_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creator_tags/1
  # DELETE /creator_tags/1.json
  def destroy
    @creator_tag.destroy
    respond_to do |format|
      format.html { redirect_to creator_tags_url, notice: 'Creator tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator_tag
      @creator_tag = CreatorTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creator_tag_params
      params.require(:creator_tag).permit(:creator_id, :tag_id)
    end
end
