class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new;end

  def create
    user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if user
      session[:user_id] = user.id
      flash[:success] = 'ログインに成功しました'
      redirect_to events_path
    else
      flash.now[:warning] = 'ログインに失敗しました'
      render :new, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to login_path
  end
end
