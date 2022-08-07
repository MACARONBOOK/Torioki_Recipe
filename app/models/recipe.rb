class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_tag_relations, dependent: :delete_all, validate: false
  has_many :tags, through: :recipe_tag_relations
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many_attached :image

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50}
  validates :introduction, presence: true, length: { maximum: 140}
  validates :material, presence: true, length: { minimum: 5, maximum: 200}
  validates :amount, presence: true
  validates :flow, presence: true, length: {maximum: 200}
  validates :advise, presence: true, length: { maximum: 100}

  validate :require_any_materials
  validate :require_any_flows

  def require_any_materials
    errors.add(:base, "材料は1つ以上登録してください。") if self.materials.blank?
  end

  def require_any_flows
    errors.add(:base, "作り方は1つ以上登録してください。") if self.flows.blank?
  end


  # 既にブックマークしていないか確認
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  # 複数のタグ付け機能で実装
  def tags_save(tag_list)
    if !tags.nil?
      recipe_tags_records = RecipeTag.where(recipe_id: id)
      recipe_tags_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag = Tag.where(tag_name: tag).first_or_create
      tags << inspected_tag
    end
  end

end
