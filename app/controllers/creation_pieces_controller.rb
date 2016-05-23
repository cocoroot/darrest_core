class CreationPiecesController < ApplicationController
  before_action :set_creation_piece, only: [:show, :edit, :update, :destroy]

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
    @creation_piece = CreationPiece.new(creation_piece_params)

    respond_to do |format|
      if @creation_piece.save
        format.html { redirect_to @creation_piece, notice: 'Creation piece was successfully created.' }
        format.json { render :show, status: :created, location: @creation_piece }
      else
        format.html { render :new }
        format.json { render json: @creation_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creation_pieces/1
  # PATCH/PUT /creation_pieces/1.json
  def update
    respond_to do |format|
      if @creation_piece.update(creation_piece_params)
        format.html { redirect_to @creation_piece, notice: 'Creation piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @creation_piece }
      else
        format.html { render :edit }
        format.json { render json: @creation_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creation_pieces/1
  # DELETE /creation_pieces/1.json
  def destroy
    @creation_piece.destroy
    respond_to do |format|
      format.html { redirect_to creation_pieces_url, notice: 'Creation piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creation_piece
      @creation_piece = CreationPiece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creation_piece_params
      params.require(:creation_piece).permit(:creation_id, :name, :description, :file_name, :format, :image)
    end
end
