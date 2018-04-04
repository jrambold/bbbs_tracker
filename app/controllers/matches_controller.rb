class MatchesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @matches = @user.matches
  end

  def new
    @user = User.find(params[:user_id])
    if current_user == @user
      @match = @user.matches.new
    else
      flash[:error] = "You can only create your own matches!"
      redirect_to user_matches_path(user)
    end
  end

  def create
    user = User.find(params[:user_id])
    if current_user == user
      match = user.matches.new(match_params)
      if match.save
        redirect_to user_matches_path(match.user)
      else
        render :new
      end
    else
      flash[:error] = "You can only create your own matches!"
      redirect_to user_matches_path(match.user)
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  def edit
    match = Match.find(params[:id])
    if current_user == match.user
      @match = match
    else
      flash[:error] = "You can only edit your own matches!"
      redirect_to user_matches_path(match.user)
    end
  end

  def update
    match = Match.find(params[:id])
    if current_user == match.user
      match.update(match_params)
      if match.save
        flash[:success] = "Match updated!"
        redirect_to user_matches_path(match.user)
      else
        render :edit
      end
    else
      flash[:error] = "You can only edit your own matches!"
      redirect_to user_matches_path(match.user)
    end
  end

  def destroy
    match = Match.find(params[:id])
    match.destroy

    flash[:success] = "Match was successfully deleted!"
    redirect_to user_matches_path(current_user)
  end

  private

  def match_params
    params.require(:match).permit(:big, :little, :guardian)
  end
end
