class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    flash[:success] = "#{user.name} was successfully deleted!"
    redirect_to admin_users_path
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      flash[:success] = "#{user.name} updated!"
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :group)
  end
end
