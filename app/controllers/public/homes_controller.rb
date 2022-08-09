class Public::HomesController < ApplicationController

  def top
    if user_signed_in?
      @recipes = Recipe.includes([:bookmarks], [:user]).page(params[:page]).limit(3)
    else
      @recipes = Recipe.includes([:user]).page(params[:page]).limit(3)
    end
  end

  def search
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path, alert: "ご利用誠にありがとうございました。"
  end

end
