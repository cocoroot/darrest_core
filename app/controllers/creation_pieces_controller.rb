class CreationPiecesController < ApplicationController
  # POST /creation_pieces
  def create
    @result = CreateCreationPieceLogic.new.execute(params_for_create)

    respond_to do |format|
      format.json { render :index, status: :created }
    end
  end

  # PATCH/PUT /creation_pieces/1
  def update
    @result = UpdateCreationPieceLogic.new.execute(params_for_update)

    respond_to do |format|
      format.json { render :index, status: :ok }
    end
  end

  # DELETE /creation_pieces/1
  def destroy
    @result = DeleteCreationPieceLogic.new.execute(params_for_delete)

    respond_to do |format|
      format.json { render :index, status: :ok }
    end
  end

  private

  def params_for_create
    {
      site_id: site_id,
      creation_piece: {
        creation_id: params[:creation_id],
        name: params[:name],
        file: params[:file],
        image: params[:image]
      }
    }
  end

  def params_for_update
    {
      site_id: site_id,
      creation_piece: {
        id: params[:id],
        name: params[:creation_piece][:name]
      }
    }
  end

  def params_for_delete
    {
      site_id: site_id,
      id: params[:id]
    }
  end
end
