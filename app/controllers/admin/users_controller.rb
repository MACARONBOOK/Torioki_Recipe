class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit, :admins]
  before_action :set_user, except: [:index, :admins]
  before_action :correct_user, only: [:edit, :update]

  def admins
    redirect_to new_admin_registration_path
  end


  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @recipes = @user.recipes.page(params[:page]).per(4)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :nickname, :introduction, :email, :is_valid)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to edit_admin_user_path unless @user != current_user
  end
end
