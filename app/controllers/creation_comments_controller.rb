class CreationCommentsController < ApplicationController
  before_action :set_creation_comment, only: [:show, :edit, :update, :destroy]

  # GET /creation_comments
  # GET /creation_comments.json
  def index
    @creation_comments = CreationComment.all
  end

  # GET /creation_comments/1
  # GET /creation_comments/1.json
  def show
  end

  # GET /creation_comments/new
  def new
    @creation_comment = CreationComment.new
  end

  # GET /creation_comments/1/edit
  def edit
  end

  # POST /creation_comments
  # POST /creation_comments.json
  def create
    @creation_comment = CreationComment.new(creation_comment_params)

    respond_to do |format|
      if @creation_comment.save
        format.html { redirect_to @creation_comment, notice: 'Creation comment was successfully created.' }
        format.json { render :show, status: :created, location: @creation_comment }
      else
        format.html { render :new }
        format.json { render json: @creation_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creation_comments/1
  # PATCH/PUT /creation_comments/1.json
  def update
    respond_to do |format|
      if @creation_comment.update(creation_comment_params)
        format.html { redirect_to @creation_comment, notice: 'Creation comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @creation_comment }
      else
        format.html { render :edit }
        format.json { render json: @creation_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creation_comments/1
  # DELETE /creation_comments/1.json
  def destroy
    @creation_comment.destroy
    respond_to do |format|
      format.html { redirect_to creation_comments_url, notice: 'Creation comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creation_comment
      @creation_comment = CreationComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creation_comment_params
      params.require(:creation_comment).permit(:sid, :creation_id, :user_id, :parent_id, :notice_code)
    end
end
