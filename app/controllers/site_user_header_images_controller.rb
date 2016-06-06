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
      site_user_header_image: {
        site_user_id: site_user_id,
        image: params[:image]
      }
    }
  end
end
