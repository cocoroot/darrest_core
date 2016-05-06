class Manage::CreationCommentsController < ApplicationController
  before_action :set_manage_creation_comment, only: [:show, :edit, :update, :destroy]

  # GET /manage/creation_comments
  # GET /manage/creation_comments.json
  def index
    @manage_creation_comments = CreationComment.all
  end

  # GET /manage/creation_comments/1
  # GET /manage/creation_comments/1.json
  def show
  end

  # GET /manage/creation_comments/new
  def new
    @manage_creation_comment = CreationComment.new
  end

  # GET /manage/creation_comments/1/edit
  def edit
  end

  # POST /manage/creation_comments
  # POST /manage/creation_comments.json
  def create
    @manage_creation_comment = CreationComment.new(manage_creation_comment_params)

    respond_to do |format|
      if @manage_creation_comment.save
        format.html { redirect_to @manage_creation_comment, notice: 'Creation comment was successfully created.' }
        format.json { render :show, status: :created, location: @manage_creation_comment }
      else
        format.html { render :new }
        format.json { render json: @manage_creation_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/creation_comments/1
  # PATCH/PUT /manage/creation_comments/1.json
  def update
    respond_to do |format|
      if @manage_creation_comment.update(manage_creation_comment_params)
        format.html { redirect_to @manage_creation_comment, notice: 'Creation comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_creation_comment }
      else
        format.html { render :edit }
        format.json { render json: @manage_creation_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/creation_comments/1
  # DELETE /manage/creation_comments/1.json
  def destroy
    @manage_creation_comment.destroy
    respond_to do |format|
      format.html { redirect_to manage_creation_comments_url, notice: 'Creation comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_creation_comment
      @manage_creation_comment = CreationComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_creation_comment_params
      params.require(:manage_creation_comment).permit(:sid, :creation_id, :user_id, :parent_id, :notice_code)
    end
end
