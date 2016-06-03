class GoodsController < ApplicationController
  # GET /goods
  def index
    @result = IndexGoodByUserLogic.new.execute(params_for_index_by_user)
  end

  # POST /goods
  def create
    @result = CreateGoodLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created, location: @result[:good] }
    end
  end

  # DELETE /goods/1
  def destroy
    @result = DeleteGoodLogic.new.execute(params_for_delete)

    respond_to do |format|
      format.json { head :no_content }
    end
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
      good: params.require(:good).permit(:site_user_id).merge(creation_id: params[:creation_id])
    }
  end

  def params_for_delete
    {
      site_id: site_id,
      id: params[:id]
    }
  end
end
