class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index,:about,:createUser]
  def index
  end
  def about
    #code
  end
  def menu
    #code
  end
  def createUser
    @user = User.new
  end

  def createUserP
    @user = User.new(admin_params)
    @user.save
    redirect_to home_createUser_path
  end

  def admin_params
    if current_user.admin
      params.require(:user).permit(:email,:password,:password_confirmation,:admin)
    end
  end
end
