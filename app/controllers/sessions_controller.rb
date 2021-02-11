class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new;end

  def create
    user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = 'ログインに成功しました'
      redirect_to events_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
