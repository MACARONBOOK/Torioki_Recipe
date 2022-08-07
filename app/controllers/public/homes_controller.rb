class Public::HomesController < ApplicationController

  def top
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
