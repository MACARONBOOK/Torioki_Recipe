class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, except: [:index]
  before_action :correct_user, only: [:edit, :update]

  def index
  end

  def show
  end

  def edit
  end

  def confirm
  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction, :is_valid)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
