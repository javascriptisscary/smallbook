class PostsController < ApplicationController
  before_action :require_user, only: [:create, :update, :destroy]
  #before_action :edit_profile, only: [:create, :update, :destroy]
  
 
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      
      flash[:notice] ="Post Successfully Created!"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] ="Post not created"
      redirect_to user_path(current_user.id)
    end
  end

  
  def update
    
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end
  


  private
  
   
  
  
    def post_params
      params.require(:post).permit(:content, :user_id)
    end



end
