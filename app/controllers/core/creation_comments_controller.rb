class Core::CreationCommentsController < ApplicationController
  before_action :set_core_creation_comment, only: [:show, :edit, :update, :destroy]

  # GET /core/creation_comments
  # GET /core/creation_comments.json
  def index
    @core_creation_comments = Core::CreationComment.all
  end

  # GET /core/creation_comments/1
  # GET /core/creation_comments/1.json
  def show
  end

  # GET /core/creation_comments/new
  def new
    @core_creation_comment = Core::CreationComment.new
  end

  # GET /core/creation_comments/1/edit
  def edit
  end

  # POST /core/creation_comments
  # POST /core/creation_comments.json
  def create
    @core_creation_comment = Core::CreationComment.new(core_creation_comment_params)

    respond_to do |format|
      if @core_creation_comment.save
        format.html { redirect_to @core_creation_comment, notice: 'Creation comment was successfully created.' }
        format.json { render :show, status: :created, location: @core_creation_comment }
      else
        format.html { render :new }
        format.json { render json: @core_creation_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core/creation_comments/1
  # PATCH/PUT /core/creation_comments/1.json
  def update
    respond_to do |format|
      if @core_creation_comment.update(core_creation_comment_params)
        format.html { redirect_to @core_creation_comment, notice: 'Creation comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_creation_comment }
      else
        format.html { render :edit }
        format.json { render json: @core_creation_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core/creation_comments/1
  # DELETE /core/creation_comments/1.json
  def destroy
    @core_creation_comment.destroy
    respond_to do |format|
      format.html { redirect_to core_creation_comments_url, notice: 'Creation comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_creation_comment
      @core_creation_comment = Core::CreationComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_creation_comment_params
      params.require(:core_creation_comment).permit(:sid, :creation_id, :user_id, :parent_id, :notice_code)
    end
end
