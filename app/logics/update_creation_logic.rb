# coding: utf-8
class UpdateCreationLogic < LogicBase

  def authorize(params)
    @errors.add(:id, 'Creation does not exist.') unless Creation.exists?(id: params[:creation][:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    @creation = Creation.lock.find(params[:creation][:id])
    @creation.assign_attributes(params[:creation])

    #
    # 型チェック
    #
    @creation.valid?
    @errors << @creation.errors.messages

    #
    # 論理チェック
    #
    site_id = params[:site_id]

    @errors.add(:creation, 'Creation does not belong to the Site.') if site_id != @creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    @creation.save!

    { creation: @creation, errors: @errors, warnings: @warnings }
  end

end
