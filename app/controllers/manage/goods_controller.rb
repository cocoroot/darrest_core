class Manage::GoodsController < ApplicationController
  before_action :set_manage_good, only: [:show, :edit, :update, :destroy]

  # GET /manage/goods
  # GET /manage/goods.json
  def index
    @manage_goods = Good.all
  end

  # GET /manage/goods/1
  # GET /manage/goods/1.json
  def show
  end

  # GET /manage/goods/new
  def new
    @manage_good = Good.new
  end

  # GET /manage/goods/1/edit
  def edit
  end

  # POST /manage/goods
  # POST /manage/goods.json
  def create
    @manage_good = Good.new(manage_good_params)

    respond_to do |format|
      if @manage_good.save
        format.html { redirect_to @manage_good, notice: 'Good was successfully created.' }
        format.json { render :show, status: :created, location: @manage_good }
      else
        format.html { render :new }
        format.json { render json: @manage_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/goods/1
  # PATCH/PUT /manage/goods/1.json
  def update
    respond_to do |format|
      if @manage_good.update(manage_good_params)
        format.html { redirect_to @manage_good, notice: 'Good was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_good }
      else
        format.html { render :edit }
        format.json { render json: @manage_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/goods/1
  # DELETE /manage/goods/1.json
  def destroy
    @manage_good.destroy
    respond_to do |format|
      format.html { redirect_to manage_goods_url, notice: 'Good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_good
      @manage_good = Good.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_good_params
      params.require(:manage_good).permit(:creation_id, :user_id)
    end
end
