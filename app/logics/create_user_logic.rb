# coding: utf-8
class CreateUserLogic < LogicBase

  def authorize(params)
    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    #
    # 型チェック
    #
    @user = User.new(params[:user])
    @user.valid?
    @errors << @user.errors.messages

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @user.save!

    { user: @user, errors: @errors, warnings: @warnings }
  end

end
