class SessionsController < ApplicationController
  def github
    @user = User.find_or_create_from_omniauth(auth_hash)
    session[:user_id] = @user.id
    flash.notice = "You are not signed in as #{@user.username}"
    redirect_to hobbies_path
  end

  def destroy
    session[:user_id] = nil
    flash.notice = "You have been signed out"
    redirect_to "/"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
