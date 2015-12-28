class WelcomeController < ApplicationController
  def index
    @user = User.new
  end
  



private

    def welcome_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end