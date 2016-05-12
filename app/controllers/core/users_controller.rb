class Core::UsersController < ApplicationController
  before_action :set_core_user, only: [:show, :edit, :update, :destroy]

  # GET /core/users
  # GET /core/users.json
  def index
    @core_users = Core::User.all
  end

  # GET /core/users/1
  # GET /core/users/1.json
  def show
  end

  # GET /core/users/new
  def new
    @core_user = Core::User.new
  end

  # GET /core/users/1/edit
  def edit
  end

  # POST /core/users
  # POST /core/users.json
  def create
    @core_user = Core::User.new(core_user_params)

    respond_to do |format|
      if @core_user.save
        format.html { redirect_to @core_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @core_user }
      else
        format.html { render :new }
        format.json { render json: @core_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/users/1
  # PATCH/PUT /core/users/1.json
  def update
    respond_to do |format|
      if @core_user.update(core_user_params)
        format.html { redirect_to @core_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_user }
      else
        format.html { render :edit }
        format.json { render json: @core_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/users/1
  # DELETE /core/users/1.json
  def destroy
    @core_user.destroy
    respond_to do |format|
      format.html { redirect_to core_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_user
      @core_user = Core::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_user_params
      params.require(:core_user).permit(:baas_id)
    end
end
