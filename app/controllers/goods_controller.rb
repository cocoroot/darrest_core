class GoodsController < ApplicationController
  # GET /goods
  def index
    @result = IndexGoodByUserLogic.new.execute(params_for_index_by_user)

    render status: convert_status(@result[:status])
  end

  # POST /good
  def create
    @result = CreateGoodLogic.new.execute(params_for_create)

    render status: convert_status(@result[:status])
  end

  # DELETE /good
  def destroy
    @result = DeleteGoodLogic.new.execute(params_for_delete)

    render status: convert_status(@result[:status])
  end

  private

  def params_for_index_by_user
    {
      site_id: site_id,
      site_user_id: params.require(:site_user_id)
    }
  end

  def params_for_index_on_creation
    {
      site_id: site_id,
      creation_id: params.require(:creation_id)
    }
  end

  def params_for_create
    {
      site_id: site_id,
      good: {
        creation_id: params[:creation_id],
        site_user_id: site_user_id
      }
    }
  end

  def params_for_delete
    {
      site_id: site_id,
      good: {
        creation_id: params[:creation_id],
        site_user_id: site_user_id
      }
    }
  end
end
