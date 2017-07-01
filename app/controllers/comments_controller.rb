class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id= current_user.id
     
    if @comment.save
      redirect_to :back
    else
      flash[:alert] = "Sorry, something went wrong."
      render user_path
    end
  end

  def destroy
    @comment= Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment erased."
    redirect_to :back
  end

  private
  
  def comment_params
      params.require(:comment).permit(:content, :post_id)
  end

end 