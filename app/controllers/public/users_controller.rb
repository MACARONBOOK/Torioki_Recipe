class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, except: [:index]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    if @user == current_user
        render 'edit'
    else
        redirect_to user_path(@user), alert: '本人のみ編集可能です。'
    end
  end

  def update
    # 順番を変えた(ActiveStorageの画像が反映されるよう)
    @user.image.attach(account_update_params[:image])
    yield @user if block_given?
    @user = User.find(params[:id])
    @user = current_user
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
  end

  def bookmarks
    @user = User.find(params[:id])
    # ユーザーがしたブックマークとrecipe_id
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:recipe_id)
    @bookmark_recipes = Recipe.order('id DESC').find(bookmarks)
  end

  def comments
    @user = User.find(params[:id])
    comments = Comment.where(user_id: @user.id).pluck(:recipe_id)
    @comment_recipes = Recipe.order('id DESC').find(comments)
  end


  private

  def user_params
    params.require(:user).permit( :name, :nickname, :introduction, :image, :is_valid)
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
