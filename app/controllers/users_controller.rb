class UsersController < ApplicationController


  def new
    @user = User.new  
  end

  
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] ="User Successfully Created!"
      redirect_to root_path
    else
      flash[:alert] ="User not created"
      redirect_to signup_path
    end
  end
  
  
  def show
    @user = User.find(current_user.id)
   
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
      params.require(:user).permit(:first_name, :last_name, :email, :password, :birthday, :zip, :avatar)
    end

end

