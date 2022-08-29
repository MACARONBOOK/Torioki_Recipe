class RecipeTagRelation < ApplicationRecord
  # 中間テーブル(多対多 Recipe,Tag)
  belongs_to :recipe
  belongs_to :tag

  validates :recipe_id, presence: true
  validates :tag_id, presence: true
end
