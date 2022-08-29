class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :recipes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_recipes, through: :bookmarks, source: :recipe
  has_many :comments, dependent: :destroy
   # 通知 コメントする側・される側(現在、利用検討中)
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy


  # プロフィール画像
  has_one_attached :image
   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
   end

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

  # ゲストログインの設定
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64(10)
      user.name = "ゲスト（閲覧用）"
      user.nickname = "ゲスト（閲覧用）"
    end
  end

end
