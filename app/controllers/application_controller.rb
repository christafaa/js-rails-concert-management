class ApplicationController < ActionController::Base
  before_action :require_login
  skip_before_action :require_login, only: [:home]

  def home
    if session.has_key?(:user_id)
      user = User.find(session[:user_id])
      redirect_to user_path(user)
    else
      render :home
    end
  end

  private

  def require_login
    redirect_to "/" unless session.include? :user_id
  end
end
