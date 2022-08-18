class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  # 二度連続でブックマーク登録しないように設定
  validates :user_id, uniqueness: { scope: :recipe_id }
end
