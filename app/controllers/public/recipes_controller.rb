class Public::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

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
    @user = User.guest

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
    @tag_list = @recipe.tags.pluck(:name).join(',')
    if @recipe.user == current_user
      render "edit"
    else
      redirect_back fallback_location: root_path, flash: { alert: "他人のレシピは編集できません" }
    end
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save!
      tag_list = params[:recipe][:tag_name].split(',')
      @recipe.save_tags(tag_list)
      redirect_to recipe_path(@recipe), flash: { notice: "「#{@recipe.title}」のレシピを投稿しました。" }
    else
      redirect_to new_recipe_path, flash: {
        recipe: @recipe,
        error_messages: @recipe.errors.full_messages
      }
    end
  end

  def update
    # 入力されたタグを受け取る(以前に入力していても、更新時が空だと消える)
    tag_list = params[:recipe][:tag_name].split(',')
    @recipe.images.attach(params[:images]) if @recipe.images.blank?
    @recipe.update(recipe_params)
    if @recipe.save
      @recipe.save_tags(tag_list)
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
    # キーワード検索(recipe内のtitleとintroductionとmaterialでキーワードが合致すれば検索結果が出る)
    if user_signed_in?
      @recipes = @q.result(distinct: true).includes([:bookmarks]).page(params[:page]).per(6)
    else
      @recipes = @q.result(distinct: true).includes([:user]).page(params[:page]).per(6)
    end
    @search = params[:q][:title_or_introduction_or_material_cont]
  end

  def tag_search
    # タグ検索と絞り込み
    @tag = Tag.find(params[:tag_id])
    @recipes = @tag.recipes.includes([:user], [:bookmarks])
  end


  private

  def image
    @recipes = Recipe.where(user_id: current_user.id).where.not(image: nil)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_q
      @q = Recipe.ransack(params[:q])
  end

  def recipe_params
    params.require(:recipe).permit( :title, :introduction, :user_id, :material, :flow, :advise, images: [])
  end
end