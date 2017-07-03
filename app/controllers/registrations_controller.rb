class RegistrationsController < ApplicationController 
  def new 
    @user = User.new 
  end 

  def create 
    errors = {}
    if params[:user][:first_name].nil?
      errors[:first_name] = "First name must not be blank"
    end

    if params[:user][:last_name].nil?
      errors[:last_name] = "Last name must not be blank"
    end

    if params[:user][:username].nil?
      errors[:username] = "Username must not be blank"
    end

    if params[:user][:email].nil?
      errors[:email] = "Email must not be blank"
    end

    if params[:user][:password].nil?
      errors[:password] = "Password must not be blank"
    end

    if errors.empty?
      user = User.new(user_params)
      if user.save 
        flash[:notice] = "User was created successfully"
        redirect_to root_path 
      # else 
      #   flash[:errors] = user.errors
      #   render :new
      end 
    else 
      flash[:errors] = errors 
      render :new 
    end
  end

  private 

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
end