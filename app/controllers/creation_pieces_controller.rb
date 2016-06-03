class CreationPiecesController < ApplicationController
  # POST /creation_pieces
  def create
    @result = CreateCreationPieceLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :show, status: :created, location: @result[:creation_piece] }
    end
  end

  # PATCH/PUT /creation_pieces/1
  def update
    @result = UpdateCreationPieceLogic.new.execute(params_for_update)

    respond_to do |format|
      format.json { render :show, status: :ok, location: @result[:creation_piece] }
    end
  end

  # DELETE /creation_pieces/1
  def destroy
    @result = DeleteCreationPieceLogic.new.execute(params_for_delete)

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      creation_piece: params.require(:creation_piece).permit(:name, :file, :image).merge(creation_id: params[:creation_id])
    }
  end

  def params_for_update
    {
      site_id: site_id,
      creation_piece: params.require(:creation_piece).permit(:name).merge(id: params[:id])
    }
  end

  def params_for_delete
    {
      site_id: site_id,
      id: params[:id]
    }
  end
end
