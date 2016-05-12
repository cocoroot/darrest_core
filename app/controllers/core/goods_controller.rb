class Core::GoodsController < ApplicationController
  before_action :set_core_good, only: [:show, :edit, :update, :destroy]

  # GET /core/goods
  # GET /core/goods.json
  def index
    @core_goods = Core::Good.all
  end

  # GET /core/goods/1
  # GET /core/goods/1.json
  def show
  end

  # GET /core/goods/new
  def new
    @core_good = Core::Good.new
  end

  # GET /core/goods/1/edit
  def edit
  end

  # POST /core/goods
  # POST /core/goods.json
  def create
    @core_good = Core::Good.new(core_good_params)

    respond_to do |format|
      if @core_good.save
        format.html { redirect_to @core_good, notice: 'Good was successfully created.' }
        format.json { render :show, status: :created, location: @core_good }
      else
        format.html { render :new }
        format.json { render json: @core_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/goods/1
  # PATCH/PUT /core/goods/1.json
  def update
    respond_to do |format|
      if @core_good.update(core_good_params)
        format.html { redirect_to @core_good, notice: 'Good was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_good }
      else
        format.html { render :edit }
        format.json { render json: @core_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/goods/1
  # DELETE /core/goods/1.json
  def destroy
    @core_good.destroy
    respond_to do |format|
      format.html { redirect_to core_goods_url, notice: 'Good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_good
      @core_good = Core::Good.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_good_params
      params.require(:core_good).permit(:creation_id, :user_id)
    end
end
