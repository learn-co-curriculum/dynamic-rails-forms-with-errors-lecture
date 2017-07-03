class RegistrationsController < ApplicationController 
  def new 
    @user = User.new 
  end 

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:notice] = "User was created successfully"
      redirect_to root_path 
    else 
      flash[:errors] = @user.errors
      render :new
    end 
  end

  private 

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
end