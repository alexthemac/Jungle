class SessionsController < ApplicationController
  def new
  end

  def create


    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id (user.id) inside the browser cookie (session[:user_id]). 
      # This is how we keep the user logged in when they navigate around our website.
      # session is part of bycrypt
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end
  #   #find user in DB and store in user variable if exists
  #   user = User.find_by_email(params[:email])
  #   # If the user exists AND the password entered is correct.
  #   if user && user.authenticate(params[:password])
  #     # Save the user id (user.id) inside the browser cookie (session[:user_id]). 
  #     # This is how we keep the user logged in when they navigate around our website.
  #     # session is part of bycrypt
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #     # If user's login doesn't work, send them back to the login form.
  #     redirect_to '/login'
  #   end

  # end

  # Sets cookie to nil and redirects to login page
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
