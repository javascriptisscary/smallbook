class FriendRequestsController < ApplicationController
  
  def create
    @friend_request = current_user.friend_requests.build(respondee_id:  params[:respondee] )
    
    if @friend_request.save
        flash[:notice] = "Friend request sent"
        redirect_to current_user
    else
        flash[:alert] ="Friend request not sent"
        redirect_to :back
    end
    
    
  end
  
  
  def update
    
  end
  
  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
    flash[:notice] ="Friend request deleted"
  end








end  