class Core::PiecesController < ApplicationController
  before_action :set_core_piece, only: [:show, :edit, :update, :destroy]

  # GET /core/pieces
  # GET /core/pieces.json
  def index
    @core_pieces = Core::Piece.all
  end

  # GET /core/pieces/1
  # GET /core/pieces/1.json
  def show
  end

  # GET /core/pieces/new
  def new
    @core_piece = Core::Piece.new
  end

  # GET /core/pieces/1/edit
  def edit
  end

  # POST /core/pieces
  # POST /core/pieces.json
  def create
    @core_piece = Core::Piece.new(core_piece_params)

    respond_to do |format|
      if @core_piece.save
        format.html { redirect_to @core_piece, notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @core_piece }
      else
        format.html { render :new }
        format.json { render json: @core_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/pieces/1
  # PATCH/PUT /core/pieces/1.json
  def update
    respond_to do |format|
      if @core_piece.update(core_piece_params)
        format.html { redirect_to @core_piece, notice: 'Piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_piece }
      else
        format.html { render :edit }
        format.json { render json: @core_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/pieces/1
  # DELETE /core/pieces/1.json
  def destroy
    @core_piece.destroy
    respond_to do |format|
      format.html { redirect_to core_pieces_url, notice: 'Piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_piece
      @core_piece = Core::Piece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_piece_params
      params.require(:core_piece).permit(:creation_id, :name, :description, :file_name, :format, :image)
    end
end
