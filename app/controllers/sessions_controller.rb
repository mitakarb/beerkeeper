class SessionsController < ApplicationController
  def new;end

  def create
    user = User.find_by(id: params[:user_id])

    if user
      session[:user_id] = user.id
      redirect_to events_path
    else
      render :new
    end
  end
end
