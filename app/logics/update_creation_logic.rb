# coding: utf-8
class UpdateCreationLogic < LogicBase

  def authorize(params)
    @errors.add(:site, 'does not exist.') unless Site.exists?(id: params[:site_id])
    @errors.add(:creation, 'does not exist.') unless Creation.exists?(id: params[:creation][:id])

    { errors: @errors, warnings: @warnings }
  end

  def validate(params)
    @creation = Creation.lock.find(params[:creation][:id])
    @status_before = @creation.creation_status
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

    @errors.add(:creation, 'does not belong to the Site.') if site_id != @creation.site_id

    { errors: @errors, warnings: @warnings }
  end

  def execute(params)
    if @status_before == CreationStatus::CREATING && @creation.creation_status == CreationStatus::PUBLISHED
      @creation.published_at = DateTime.now
    end
    @creation.save!

    { creation: @creation, errors: @errors, warnings: @warnings, status: :ok }
  end

end
