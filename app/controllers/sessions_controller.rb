class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    session[:access_token] = env["omniauth.auth"].credentials.token
    redirect_to main_dropbox_path, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_url, notice: "Signed out!"
  end

end
