class Core::CreatorsController < ApplicationController
  before_action :set_core_creator, only: [:show, :edit, :update, :destroy]

  # GET /core/creators
  # GET /core/creators.json
  def index
    @core_creators = Core::Creator.all
  end

  # GET /core/creators/1
  # GET /core/creators/1.json
  def show
  end

  # GET /core/creators/new
  def new
    @core_creator = Core::Creator.new
  end

  # GET /core/creators/1/edit
  def edit
  end

  # POST /core/creators
  # POST /core/creators.json
  def create
    @core_creator = Core::Creator.new(core_creator_params)

    respond_to do |format|
      if @core_creator.save
        format.html { redirect_to @core_creator, notice: 'Creator was successfully created.' }
        format.json { render :show, status: :created, location: @core_creator }
      else
        format.html { render :new }
        format.json { render json: @core_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creators/1
  # PATCH/PUT /core/creators/1.json
  def update
    respond_to do |format|
      if @core_creator.update(core_creator_params)
        format.html { redirect_to @core_creator, notice: 'Creator was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creator }
      else
        format.html { render :edit }
        format.json { render json: @core_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creators/1
  # DELETE /core/creators/1.json
  def destroy
    @core_creator.destroy
    respond_to do |format|
      format.html { redirect_to core_creators_url, notice: 'Creator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creator
      @core_creator = Core::Creator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creator_params
      params.require(:core_creator).permit(:sid, :user_id, :name, :description)
    end
end
