class PostsController < ApplicationController
  before_action :require_user, only: [:create, :update, :destroy]
  #before_action :edit_profile, only: [:create, :update, :destroy]
  
 
  def create
    
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    #we're going to have to check that the hidden field id is an actually a friend of the user, since hidden field
    #can be abused with JS
    
    if @post.save
      
      flash[:notice] ="Post Successfully Created!"
      redirect_to :back
    else
      flash[:alert] ="Post not created"
      redirect_to :back
    end
  end

  
  def update
    
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] ="Post Successfully Deleted!"
    redirect_to :back
  end
  


  private
  
   
  
  
    def post_params
      params.require(:post).permit(:content, :profile_id)
    end



end
