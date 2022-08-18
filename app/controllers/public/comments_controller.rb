class Public::CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments.order('created_at desc')
    @comment = current_user.comments.new(comment_params)
    @comment_new = Comment.new
    @comment.recipe_id = @recipe.id
    if @comment.save
      @comment = Comment.new
      notification = Notification.new
      notification.create_comment_notification(current_user, @comment, @recipe.user.id, @recipe.id)
      # redirect_to @comment.recipe
    else
      redirect_to request.referer
      # flash[:error_messages] = @comment.errors.full_messages
      # redirect_back fallback_location: @comment.recipe
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments
    if Comment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    else
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :recipe_id, :name, :content, :rate)
  end
end
