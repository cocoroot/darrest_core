class Manage::CreatorsController < ApplicationController
  before_action :set_manage_creator, only: [:show, :edit, :update, :destroy]

  # GET /manage/creators
  # GET /manage/creators.json
  def index
    @manage_creators = Manage::Creator.all
  end

  # GET /manage/creators/1
  # GET /manage/creators/1.json
  def show
  end

  # GET /manage/creators/new
  def new
    @manage_creator = Manage::Creator.new
  end

  # GET /manage/creators/1/edit
  def edit
  end

  # POST /manage/creators
  # POST /manage/creators.json
  def create
    @manage_creator = Manage::Creator.new(manage_creator_params)

    respond_to do |format|
      if @manage_creator.save
        format.html { redirect_to @manage_creator, notice: 'Creator was successfully created.' }
        format.json { render :show, status: :created, location: @manage_creator }
      else
        format.html { render :new }
        format.json { render json: @manage_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/creators/1
  # PATCH/PUT /manage/creators/1.json
  def update
    respond_to do |format|
      if @manage_creator.update(manage_creator_params)
        format.html { redirect_to @manage_creator, notice: 'Creator was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_creator }
      else
        format.html { render :edit }
        format.json { render json: @manage_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/creators/1
  # DELETE /manage/creators/1.json
  def destroy
    @manage_creator.destroy
    respond_to do |format|
      format.html { redirect_to manage_creators_url, notice: 'Creator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_creator
      @manage_creator = Manage::Creator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_creator_params
      params.require(:manage_creator).permit(:sid, :user_id, :name, :description)
    end
end
