class UsersController < ApplicationController
  def new
  end
  

  def create
    # Create new user object based on what's entered in form
    user = User.new(user_params)

    #user.save returns false if the correct inputs are not supplied (part of active record)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private

  # Sanitize input from form (to protect from injection attacks)
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end