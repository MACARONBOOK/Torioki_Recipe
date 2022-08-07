class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def show
    @bookmarks = Bookmark.where(user_id: current_user.id).page(params[:page]).per(10)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @bookmark = @recipe.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
      notification = Notification.new
      notification.create_bookmark_notification(current_user, @recipe.user_id, @recipe.id)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @bookmark = @recipe.bookmarks.find_by(user_id: current_user.id)
    if @bookmark.present?
      @bookmark.destroy
    else
      redirect_to request.referer
    end
  end
end
