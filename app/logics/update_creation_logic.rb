# coding: utf-8
class UpdateCreationLogic < LogicBase

  def authorize(params)
    @errors.add(:id, 'Creation does not exist.') unless Creation.exists?(id: params[:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    @creation = Creation.find(params[:id])
    @creation.assign_attributes(params)

    #
    # 型チェック
    #
    @creation.valid?
    @errors << @creation.errors.messages

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation.update!(params)

    { creation: @creation, errors: @errors, warnings: @warnings }
  end

end
