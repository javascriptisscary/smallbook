class FriendshipsController < ApplicationController

  def index
   
  end


  def show
     @user = User.find(params[:id])
    puts "here i am fdsafldsajflsdaj ;lFINDME FINDME FINDIME #{@user} "    
  
  end



  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "Unable to add friend"
      redirect_to user_path(current_user.id)
    
    end
    
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to user_path(current_user.id)
  end

private
  
  def friendship_params
    params.permit(:friend_id)
  end

end
