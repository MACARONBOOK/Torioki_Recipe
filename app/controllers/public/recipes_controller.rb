class Public::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @title = "レシピ一覧"
    @recipes = params[:tag_id].present? ? Tag.find(params[:tag_id]).recipes : Recipe

    if user_signed_in?
      @recipes = @recipes.includes([:user],[:bookmarks]).page(params[:page]).per(6)
    else
      @recipes = @recipes.includes([:user]).page(params[:page]).per(6)
    end
  end

  def show
    @title = "#{@recipe.title}"
    @comments = Comment.includes([:user]).where(recipe_id: @recipe.id)

    if user_signed_in?
      @comment = current_user.comments.new(flash[:comment])
      @comment_reply = current_user.comments.new
    end
  end

  def new
    @recipe = Recipe.new(flash[:recipe])
  end

  def edit
    @title = "#{@recipe.title}の編集"
    @tag_list = @post.tags.pluck(:name).join(',')
    if @recipe.user == current_user
      render "edit"
    else
      redirect_back fallback_location: root_path, flash: { alert: "他人のレシピは編集できません" }
    end
  end

  def create
     recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      tag_list = params[:recipe][:name].split(',')
      @post.save_tag(tag_list)
      redirect_to recipe, flash: { notice: "「#{recipe.title}」のレシピを投稿しました。" }
    else
      redirect_to new_recipe_path, flash: {
        recipe: recipe,
        error_messages: recipe.errors.full_messages
      }
    end
  end

  def update
    # 入力されたタグを受け取る
    tag_list = params[:recipe][:name].split(',')
    @recipe.update(recipe_params)
    if @recipe.save
      @recipe.save_tag(tag_list)
      redirect_to @recipe, flash: { notice: "「#{@recipe.title}」のレシピを更新しました。" }
    else
      flash[:recipe] = @recipe
      flash[:error_messages] = @recipe.errors.full_messages
      redirect_back fallback_location: @recipe
    end
  end

  def destroy
    @recipe.destroy
    redirect_to user_path(current_user.id), flash: { notice: "「#{@recipe.title}のレシピを削除しました。」"}
  end

  def search
  end

  private

  def set_recipe
    @recipe = Recipe.include(:tags).find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:image, :title, :introduction,:user_id, :material, :flow, :advise, :tags_attributes [:id, :tag_name])
  end
end