class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, except: [:index]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.includes(:recipes).page(params[:page]).per(6).order(id: :ASC)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    # redirect_to request.referer if current_user.id == User.guest.id
    if @user == current_user
        render 'edit'
    else
        redirect_to user_path(@user), alert: '本人のみ編集可能です。'
    end
  end

  def update
#   順番を変えた
    # @user.image.attach(account_update_params[:image])
    # yield @user if block_given?
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :nickname, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
