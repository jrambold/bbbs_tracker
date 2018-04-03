class MatchesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @matches = @user.matches
  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
