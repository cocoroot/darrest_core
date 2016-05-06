class Manage::PiecesController < ApplicationController
  before_action :set_manage_piece, only: [:show, :edit, :update, :destroy]

  # GET /manage/pieces
  # GET /manage/pieces.json
  def index
    @manage_pieces = Piece.all
  end

  # GET /manage/pieces/1
  # GET /manage/pieces/1.json
  def show
  end

  # GET /manage/pieces/new
  def new
    @manage_piece = Piece.new
  end

  # GET /manage/pieces/1/edit
  def edit
  end

  # POST /manage/pieces
  # POST /manage/pieces.json
  def create
    @manage_piece = Piece.new(manage_piece_params)

    respond_to do |format|
      if @manage_piece.save
        format.html { redirect_to @manage_piece, notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @manage_piece }
      else
        format.html { render :new }
        format.json { render json: @manage_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/pieces/1
  # PATCH/PUT /manage/pieces/1.json
  def update
    respond_to do |format|
      if @manage_piece.update(manage_piece_params)
        format.html { redirect_to @manage_piece, notice: 'Piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_piece }
      else
        format.html { render :edit }
        format.json { render json: @manage_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/pieces/1
  # DELETE /manage/pieces/1.json
  def destroy
    @manage_piece.destroy
    respond_to do |format|
      format.html { redirect_to manage_pieces_url, notice: 'Piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_piece
      @manage_piece = Piece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_piece_params
      params.require(:manage_piece).permit(:creation_id, :name, :description, :file_name, :format, :image)
    end
end
