class CreationPiecesController < ApplicationController
  # before_action :set_creation_piece, only: [:show, :edit, :update, :destroy]

  # GET /creation_pieces
  # GET /creation_pieces.json
  def index
    @creation_pieces = CreationPiece.all
  end

  # GET /creation_pieces/1
  # GET /creation_pieces/1.json
  def show
  end

  # GET /creation_pieces/new
  def new
    @creation_piece = CreationPiece.new
  end

  # GET /creation_pieces/1/edit
  def edit
  end

  # POST /creation_pieces
  # POST /creation_pieces.json
  def create
    @result = CreateCreationPieceLogic.new.execute(params_for_create)

    respond_to do |format|
      format.html { redirect_to @result[:creatino_piece], notice: 'Creation piece was successfully created.' }
      format.json { render :show, status: :created, location: @result[:creation_piece] }
    end
  end

  # PATCH/PUT /creation_pieces/1
  # PATCH/PUT /creation_pieces/1.json
  def update
    @result = UpdateCreationPieceLogic.new.execute(params_for_update)

    respond_to do |format|
      format.html { redirect_to @result[:creation_piece], notice: 'Creation piece was successfully updated.' }
      format.json { render :show, status: :ok, location: @result[:creation_piece] }
    end
  end

  # DELETE /creation_pieces/1
  # DELETE /creation_pieces/1.json
  def destroy
    @result = DeleteCreationPieceLogic.new.execute(params_for_delete)

    respond_to do |format|
      format.html { redirect_to creation_pieces_url, notice: 'Creation piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_creation_piece
  #   @creation_piece = CreationPiece.find(params[:id])
  # end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  
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
