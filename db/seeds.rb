# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#   email: 'admin@test.com',
#   password: '123Okazu',
# )

# User.create!(
#   name: 'まとべ',
#   nickname: 'とっぺ',
#   email: 'matobe@gmail.com',
#   password: 'mtb123A',
#   introduction: '"料理のレパートリーを増やし中です。\r\n魚の捌き方が分からないので、聞くと思います！',
#   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/toppe.png")),filename: 'toppe.png'),
#   is_valid: true
# )

# User.create!(
#   name: 'かえで',
#   nickname: 'メープル',
#   email: 'maple@gmail.com',
#   password: 'krkt475A',
#   introduction: '"料理のレパートリーを増やし中です。\r\n魚の捌き方が分からないので、聞くと思います！',
#   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/kaede.png")),filename: 'kaede.png'),
#   is_valid: true
# )

# User.create!(
#   id: 3,
#   name: 'ゲスト（閲覧用',
#   nickname: 'ゲスト（閲覧用',
#   email: 'uest@example.com',
#   is_valid: true
# )

# User.create!(
#   name: '久我恭介',
#   nickname: 'がっく',
#   email: 'kuga@gmail.com',
#   password: 'dJDG8gz3UN6qkeG',
#   introduction: '""料理ビギナーです。\r\n食材の切り方を習得中なんで、教えて下さい！',
#   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/gakku.png")),filename: 'gakku.png'),
#   is_valid: true
# )

# User.create!(
#   name: 'かいと',
#   nickname: 'くいしんぼ',
#   email: 'mogu@gmail.com',
#   password: 'hG589Etee3x',
#   introduction: '名前通り、食べるのが専門。簡単に作れるアレンジレシピを教えてほしいです。',
#   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/mogu.png")),filename: 'mogu.png'),
#   is_valid: true
# )

# Tag.create!(
#   name: "パスタ"
# )

# Tag.create!(
#   name: "カレー"
# )

# Tag.create!(
#   name: "ご飯もの"
# )

# Tag.create!(
#   name: "パン"
# )

Recipe.create!(
  [
    {
      user_id: 1,
      title: "トマトの魚介パスタ",
      introduction: "おつまみにも合う一品",
      material: "イカ…100g、ホタテの貝柱…4個、えび…6尾、白ワイン……大さじ2杯、\r\n塩・こしょう……少々、パスタ……180g、ウスターソース……小さじ1/2杯\r\n玉ねぎ……1/2個、にんにく……1片分、オリーブオイル……大さじ1杯\r\nカットトマト……1缶",
      flow: "①トマト缶を耐熱ボウルに入れ、ラップをかけてレンジで温める(600W 10分)。\r\n次にイカを輪切りに、魚介類を一口サイズに切り、塩・こしょう・白ワインをふりかけ混ぜます。\r\n沸騰した湯が入った鍋で塩を一つまみ入れ、パスタを茹でます。\r\nフライパンを熱し、オリーブオイル・にんにく・玉ねぎを炒めます。\r\n②玉ねぎがしんなりしてきたら、魚介類を投入して、色が変わるまで火を通します。\r\n③最初に温めたトマトを入れ、中火で2～3分煮込みます。\r\n④茹でて湯切りしたパスタを、フライパンに投入し、絡めます。\r\n⑤皿に盛り付けて 、完成！",
      advise: "魚介類は臭みを取るためにあらかじめ白ワインをまぶしておくのがポイントです。えびは下準備として、背わたを取り除き、殻をむきます。"
    },
    {
      user_id: 5,
      title: "カツサンド",
      introduction: "とんかつとキャベツを詰め込んだカツサンドを作りました。\r\nからしバターがアクセントになって、パクパク食べられちゃうおいしさ！\r\nドライブや、ピクニックや遠足におすすめのひと品です♪",
      material: "豚ロース肉(とんかつ用)……2枚、食パン(6枚切り)……4枚、キャベツ……2枚、バター……20g、\r\n練りがらし……小さじ1杯、中濃ソース……適量\r\n(a)[ 塩こしょう……少々(下味用),小麦粉……適量,溶き卵……1個分,パン粉……適量,サラダ油(揚げ用)……適量 ]",
      amount: "",
      flow: "①下準備として、キャベツは千切りに、食パンは耳を切り落とします。\r\n②豚肉は赤身と脂身の間に数か所切り込みを入れて筋切りをします。\r\n包丁の背で軽くたたいて両面に塩こしょうを振ります。\r\n③②を小麦粉、溶き卵、パン粉の順につけて軽く押さえます。\r\n③170℃の揚げ油に入れ、きつね色になったら裏返し、さらに3分揚げてしっかりと油を切って取り出します。\r\n④食パンの片面にからしバターをぬり、ぬった面に中濃ソースをかけたとんかつとキャベツをのせ、もう1枚の食パンで挟みます。\r\n⑤④をラップに包んで上から軽く押さえ、10分置きます。ラップを取り、半分に切ったら完成です！",
      advise: "豚肉は筋切りすると揚げても反り返らず、食パンに挟みやすくなります。\r\nまた、具材を挟んだ後、ラップで包んでなじませると断面がきれいに仕上がります。"
    }
  ]
)