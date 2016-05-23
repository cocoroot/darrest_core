class SiteUserTagsController < ApplicationController
  before_action :set_site_user_tag, only: [:show, :edit, :update, :destroy]

  # GET /site_user_tags
  # GET /site_user_tags.json
  def index
    @site_user_tags = SiteUserTag.all
  end

  # GET /site_user_tags/1
  # GET /site_user_tags/1.json
  def show
  end

  # GET /site_user_tags/new
  def new
    @site_user_tag = SiteUserTag.new
  end

  # GET /site_user_tags/1/edit
  def edit
  end

  # POST /site_user_tags
  # POST /site_user_tags.json
  def create
    @site_user_tag = SiteUserTag.new(site_user_tag_params)

    respond_to do |format|
      if @site_user_tag.save
        format.html { redirect_to @site_user_tag, notice: 'Site user tag was successfully created.' }
        format.json { render :show, status: :created, location: @site_user_tag }
      else
        format.html { render :new }
        format.json { render json: @site_user_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_user_tags/1
  # PATCH/PUT /site_user_tags/1.json
  def update
    respond_to do |format|
      if @site_user_tag.update(site_user_tag_params)
        format.html { redirect_to @site_user_tag, notice: 'Site user tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_user_tag }
      else
        format.html { render :edit }
        format.json { render json: @site_user_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_user_tags/1
  # DELETE /site_user_tags/1.json
  def destroy
    @site_user_tag.destroy
    respond_to do |format|
      format.html { redirect_to site_user_tags_url, notice: 'Site user tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_user_tag
      @site_user_tag = SiteUserTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_user_tag_params
      params.require(:site_user_tag).permit(:site_user_id, :tag_id)
    end
end
