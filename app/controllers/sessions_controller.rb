class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email]) and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success]   = 'Logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out.'
    redirect_to root_path
  end

  def callback
    user = User.from_omniauth(env["omniauth.auth"])
    if user.errors.full_messages[0] == 'Email has already been taken'
      session[:user_id] = User.find_by(email: user.email).id
      flash[:success]   = 'Logged in with your FB account'
      redirect_to root_path
    else
      flash.now[:error] = "FB log in error: #{user.errors.full_messages.to_sentence}"
      render 'new'
    end
  end
end
