class UsersController < ApplicationController

  def index 
  	@users = User.all
  end

  def new
  	@user = User.new
  end



  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Signup successful"
  		redirect_to(users_path)
  	else 
  		flash[:notice] = "Error with your signup"
  		redirect_to(new_user_path)

  	end
  end

   private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end 

end