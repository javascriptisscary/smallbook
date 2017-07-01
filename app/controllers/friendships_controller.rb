class FriendshipsController < ApplicationController

  def index
   
  end


  def show
     @user = User.find(params[:id])
  end



  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    
    if @friendship.save
      friend_request= FriendRequest.find(params[:friend_request_id])
      friend_request.destroy!
      flash[:notice] = "Added friend"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "Unable to add friend"
      redirect_to user_path(current_user.id)
    end  
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy!
    
    flash[:notice] = "Removed friendship."
    redirect_to user_path(current_user.id)
  end

private
  
  def friendship_params
    params.permit(:friend_id, friend_request_id)
  end

end
