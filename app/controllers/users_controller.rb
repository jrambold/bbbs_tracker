class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    user = User.find(params[:id])
    if current_user == user
      @user = user
    else
      flash[:error] = "You can only edit your own user!"
      redirect_to user_path(user)
    end
  end

  def update
    user = User.find(params[:id])
    if current_user == user
      user.update(user_params)
      if user.save
        flash[:success] = "#{user.name} updated!"
        redirect_to user_path(user)
      else
        render :edit
      end
    else
      flash[:error] = "You can only edit your own user!"
      redirect_to user_path(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
