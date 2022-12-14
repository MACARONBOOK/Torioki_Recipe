class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :content, presence: true, length: { maximum: 100}
  # 評価レビュー機能：1以上5以下で星を設定
  validates :rate, numericality: {
    less_than_or_equal_to: 5, greater_than_or_equal_to: 0.5,
  }, presence: true
end
