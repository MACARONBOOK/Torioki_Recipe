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
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # フォローするときのメソッド
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  # フォローを外すメソッド
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  # 既にフォロー済かどうか確認するメソッド
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end


  # プロフィール画像
  has_one_attached :image
   def get_image
    # (image.attached?) ? image : 'no_image.jpg'
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
