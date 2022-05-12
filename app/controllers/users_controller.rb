class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
<<<<<<< HEAD
      redirect_to @user, notice: 'User was successfully created.'
    else
=======
      flash[:notice] = 'ユーザー登録しました'
      redirect_to root_path
    else
      flash.now[:alert] = @user.errors.full_messages
>>>>>>> 1e18010 (Merge branch 'master' into add-registration)
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
<<<<<<< HEAD
      params.require(:user).permit(:name)
=======
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
>>>>>>> 1e18010 (Merge branch 'master' into add-registration)
    end
end
