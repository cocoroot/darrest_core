class SiteUserImagesController < ApplicationController
  # POST /site_user_images
  def create
    @result = CreateSiteUserImageLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      site_user_image: {
        site_user_id: site_user_id,
        image: params[:image]
      }
    }
  end
end
