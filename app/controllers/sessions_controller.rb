class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    provider = auth_hash[:provider]
    if provider == "dropbox_oauth2"
      auth_via_dropbox(auth_hash)
      return
    elsif provider == "github"
      auth_via_github(auth_hash)
    end

    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました'
  end


  private
  def auth_via_dropbox(auth_hash)
    if session[:user_id]
      user = User.find(session[:user_id])
      user.dropbox_token = auth_hash.credentials.token
      user.save
      redirect_to root_path, notice: "Dropboxと同期しました"
    else
      redirect_to root_path, notice: "ログインしてください"
    end
  end

  def auth_via_github(auth_hash)
    session[:github_access_token] = auth_hash.credentials.token
  end
end
