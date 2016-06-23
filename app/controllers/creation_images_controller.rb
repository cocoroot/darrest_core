class CreationImagesController < ApplicationController
  # GET /creation_images/1
  def show
    @result = LoadCreationImageLogic.new.execute(params_for_load)

    render status: convert_status(@result[:status])
  end

  # POST /creation_images
  def create
    @result = CreateCreationImageLogic.new.execute(params_for_create)

    render status: convert_status(@result[:status])
  end

  # PATCH/PUT /creation_images/1
  def update
    @result = UpdateCreationImageLogic.new.execute(params_for_update)

    render status: convert_status(@result[:status])
  end

  # DELETE /creation_images/1
  def destroy
    @result = DeleteCreationImageLogic.new.execute(params_for_delete)

    render status: convert_status(@result[:status])
  end

  private

  def params_for_create
    {
      site_id: site_id,
      creation_image: {
        creation_id: params[:creation_id],
        image: params[:image],
        order: params[:order]
      }
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
      creation_image: {
        id: params[:id],
        order: params[:creation_image][:order]
      }
    }
  end

  def params_for_delete
    {
      site_id: site_id,
      id: params[:id]
    }
  end
end
