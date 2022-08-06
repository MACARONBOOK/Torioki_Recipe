class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:nickname]

  # アソシエーション
  has_many :recipes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_recipes, through: :bookmarks, source: :recipe
  has_many :comments, dependent: :destroy

  has_one_attached :image

  # バリデーション
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }
  validates :nickname,
            presence: true,
            length: { in: 2..10 },
            uniqueness: true
  validates :introduction,
            length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,20}\z/
  validates :password,
            presence: true, on: :create,
            format: { with: VALID_PASSWORD_REGEX,
                      message: "は半角6~20文字英大文字・小文字・数字それぞれ1文字以上含む必要があります"}

   # 退会したユーザーの再ログインを防止
  def active_for_authentication?
    super && (is_valid == true)
  end



end
