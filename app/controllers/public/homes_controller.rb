class Public::HomesController < ApplicationController

  def top
    if user_signed_in?
      @recipes = Recipe.includes([:bookmarks], [:user]).order('id DESC').page(params[:page]).limit(3)
    else
      @recipes = Recipe.includes([:user]).order('id DESC').page(params[:page]).limit(3)
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

  def guest_sign_in
    user = User.find_or_create_by!(email:"guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト（閲覧用）"
      user.nickname = "ゲスト（閲覧用）"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
