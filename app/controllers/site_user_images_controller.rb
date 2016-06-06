class SiteUserImagesController < ApplicationController
  # POST /site_user_images
  def create
    @result = CreateSiteUserImageLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created, location: @result[:site_user_image] }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      site_user_image: params.require(:site_user_image).permit(:image).merge(site_user_id: site_user_id)
    }
  end
end
