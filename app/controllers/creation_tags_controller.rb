class CreationTagsController < ApplicationController
  # POST /creation_tags
  def create
    @result = CreateCreationTagLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created }
    end
  end

  # DELETE /creation_tags/1
  def destroy
    @result = DeleteCreationTagLogic.new.execute(params_for_destroy)

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      creation_tag: params.require(:creation_tag).permit(:tag_name).merge(creation_id: params[:creation_id])
    }
  end

  def params_for_destroy
    {
      site_id: site_id,
      id: params[:id]
    }
  end
end
