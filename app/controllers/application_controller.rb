class ApplicationController < ActionController::Base
  before_action :authenticate

  def authenticate
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end
end
