class CommentsController < ResourceController

  # GET /comments/new
  def new
    super
    @article = Article.find(params[:article_id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:comment).permit(:article_id, :guest_name, :guest_email, :comment, :comment_date)
  end

end
