class GoodsController < ApplicationController
  # before_action :set_good, only: [:show, :edit, :update, :destroy]

  # GET /goods
  # GET /goods.json
  def index
    @result = IndexGoodByUserLogic.new.execute(params_for_index)
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
  end

  # GET /goods/new
  def new
    @good = Good.new
  end

  # GET /goods/1/edit
  def edit
  end

  # POST /goods
  # POST /goods.json
  def create
    @result = CreateGoodLogic.new.execute(params_for_create)

    respond_to do |format|
      format.html { redirect_to @result[:good], notice: 'Good was successfully created.' }
      format.json { render :show, status: :created, location: @result[:good] }
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to @good, notice: 'Good was successfully updated.' }
        format.json { render :show, status: :ok, location: @good }
      else
        format.html { render :edit }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @result = DeleteGoodLogic.new.execute(params_for_delete)

    respond_to do |format|
      format.html { redirect_to goods_url, notice: 'Good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_good
  #   @good = Good.find(params[:id])
  # end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  # def good_params
  #   params.require(:good).permit(:creation_id, :site_user_id)
  # end
  def params_for_index
    if params.has_key?(:site_user_id)
      {
        site_id: site_id,
        site_user_id: params.require(:site_user_id)
      }
    elsif params.has_key?(:creation_id)
      {
        site_id: site_id,
        creation_id: params.require(:creation_id)
      }
    end
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
