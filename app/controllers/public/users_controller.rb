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
    @user.image.attach(account_update_params[:image])
    yield @user if block_given?
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def bookmarks
    @user = User.find(params[:id])
    # このユーザーがしたいいね　そしてそのpost_id
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:recipe_id)
    @bookmark_recipes = Recipe.order('id DESC').find(bookmarks)
  end

  def comments
    @user = User.find(params[:id])
    comments = Comment.where(user_id: @user.id).pluck(:recipe_id)
    @comment_recipes = Recipe.order('id DESC').find(comments)
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
    params.require(:user).permit( :name, :nickname, :introduction, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

  protected

  def withdraw_forbid_guest_user
      if @user.email == "guest@example.com"
        flash[:alert] = "ゲストユーザーの退会処理はできません。"
        redirect_to root_path
      end
  end

  def account_update_params
    params.permit(:account_update, keys: [:image])
  end
end
