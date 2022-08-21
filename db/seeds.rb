# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@gmail.com',
  password: '123Okazu',
)

Customer.create!(
  name: 'かえで',
  nickname: 'メープル',
  email: 'kaede@gmail.com',
  password: 'mtb123A',
  introduction: 'お菓子をよく作っています。いろいろシェアし合いたいです！',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/kaede.png")),filename: 'kaede.png'),
  is_valid: true
)

Customer.create!(
  name: 'かいと',
  nickname: 'くいしんぼ',
  email: 'mogu@gmail.com',
  password: 'hG589Etee3x',
  introduction: '名前通り、食べるのが専門。簡単に作れるアレンジレシピを教えてほしいです。',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/mogu.png")),filename: 'mogu.png'),
  is_valid: true
)

Tag.create!(
  name: "パスタ"
)

Tag.create!(
  name: "ご飯もの"
)

Tag.create!(
  name: "カレー"
)

Tag.create!(
  name: "パン"
)
