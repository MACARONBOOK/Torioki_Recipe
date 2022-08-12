class Public::CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments.order('created_at desc')
    @comment = current_user.comments.new(comment_params)
    @comment_new = Comment.new
    @comment.recipe_id = @recipe.id
    if @comment.save
      # if comment.reply_comment.nil?
        flash[:notice] = 'レシピへのコメントを投稿しました。'
      # else
      #   flash[:notice] = 'コメントに返信しました。'
      # end
      redirect_to @comment.recipe
    else
      # if comment.reply_comment.nil?
      #   redirect_to request.referer, flash[:comment] = comment
      # end

      flash[:error_messages] = @comment.errors.full_messages
      redirect_back fallback_location: @comment.recipe
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments
    if Comment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
      flash[:notice] = 'コメントを削除しました。'
    else
      redirect_to request.referer, flash[:notice] = '返信したコメントを削除しました。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :recipe_id, :name, :content, :rate)
  end
end
