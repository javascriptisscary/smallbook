class UsersController < ApplicationController
before_filter :require_user, only: [:index, :show, :edit, :update]
before_filter :edit_profile, only: [:edit, :update]


  def index
    @users = User.all
  end



  def new
    @user = User.new  
  end

  
  
  def create
    
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] ="User Successfully Created!"
      redirect_to @user
    else
      flash[:alert] ="User not created"
      render 'welcome/index'
    end
  end
  
  
  def show
  
   @profile = User.find(params[:id])
   
   @post = Post.new
   @friendships = @profile.friendships
   puts "here's the friends posts #{@friends}"
   
  end
  

  

  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
     
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: "User successfully updated."}
      else
        format.html {redirect_to @user, alert: "User not updated"}
      end
    end
  end
  
  
  
  
  private
  
   
  
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :birthday, :zip, :webpage, :avatar, :cover, :password_confirmation)
    end

end

