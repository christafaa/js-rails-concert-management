class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :create_via_omniauth]

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to "/"
    end
  end

  def create_via_omniauth
    user = User.find_by(uid: auth["uid"])

    if user.nil?
      user = User.create(uid: auth["uid"], username: auth["info"]["nickname"], password: SecureRandom.hex)
    end

    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session.clear
    redirect_to "/"
  end

  private

  def auth
    request.env["omniauth.auth"]
  end
end
