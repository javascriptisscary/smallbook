class LikesController < ApplicationController
    
    
    def create
      @like = Like.new(like_params)
      @like.user_id = current_user.id
      
      if @like.save
        flash[:notice] = "You liked post #{@like.post_id}"
        redirect_to current_user
      else
        flash[:alert] ="Like didn't work"
        redirect_to :back
      end
      
    end
    
    
    def destroy
      @like = Like.find(params[:id])
      @like.destroy
      flash[:notice] ="Successfully Unliked!"
      redirect_to current_user
        
    end
    
    
    
    private
    
    def like_params
      params.permit(:post_id, :like_id)
    end
    
   
    
end