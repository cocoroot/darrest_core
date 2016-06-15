class UsersController < ApplicationController
  # POST /users
  def create
    @result = CreateUserLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created }
    end
  end

  private

  def params_for_create
    {
      user: params.require(:user).permit(:baas_id)
    }
  end
end
