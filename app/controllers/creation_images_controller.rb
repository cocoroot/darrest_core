class CreationImagesController < ApplicationController
  # GET /creation_images/1
  def show
    @result = LoadCreationImageLogic.new.execute(params_for_load)
  end

  # POST /creation_images
  def create
    @result = CreateCreationImageLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created, location: @result[:creation_image] }
    end
  end

  # PATCH/PUT /creation_images/1
  def update
    @result = UpdateCreationImageLogic.new.execute(params_for_update)

    respond_to do |format|
      format.json { render :show, status: :ok, location: @result[:creation_image] }
    end
  end

  # DELETE /creation_images/1
  def destroy
    @result = DeleteCreationImageLogic.new.execute(params_for_delete)

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      creation_image: params.require(:creation_image).permit(:image, :image_name_for_user, :order).merge(creation_id: params[:creation_id])
    }
  end

  def params_for_load
    {
      site_id: site_id,
      id: params[:id]
    }
  end

  def params_for_update
    {
      site_id: site_id,
      creation_image: params.require(:creation_image).permit(:image_name_for_user, :order).merge(id: params[:id])
    }
  end

  def params_for_delete
    {
      site_id: site_id,
      id: params[:id]
    }
  end
end
