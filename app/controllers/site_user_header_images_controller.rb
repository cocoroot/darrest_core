class SiteUserHeaderImagesController < ApplicationController
  # POST /site_user_header_images
  def create
    @result = CreateSiteUserHeaderImageLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created, location: @result[:site_user_header_image] }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      site_user_header_image: params.require(:site_user_header_image).permit(:image, :image_name_for_user).merge(site_user_id: params[:site_user_id])
    }
  end
end
