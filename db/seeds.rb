# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@test.com',
  password: '123Okazu',
)

User.create!(
  name: 'まとべ',
  nickname: 'とっぺ',
  email: 'matobe@gmail.com',
  password: 'mtb123A',
  introduction: '料理のレパートリーを増やし中です。魚の捌き方が分からないので、聞くと思います！',
  profile_image_id: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/toppe.png")),filename: 'toppe.png'),
)

User.create!(
  name: 'かえで',
  nickname: 'メープル',
  email: 'maple@gmail.com',
  password: 'krkt475A',
  introduction: 'お菓子作りが得意です。難しいものは工程ごとに投稿します！',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/kaede.png")),filename: 'kaede.png'),
)

User.create!(
  name: 'よみ',
  nickname: 'yomi',
  email: 'yomi@gmail.com',
  password: 'ay080bvD',
  introduction: '夜食を作る事が多いので、低カロリーなレシピを知りたいです。',
  #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/yomi.png")),filename: 'yomi.png'),
)

User.create!(
  name: '久我恭介',
  nickname: 'がっく',
  email: 'kuga@gmail.com',
  password: 'dJDG8gz3UN6qkeG',
  introduction: '料理ビギナーです。食材の切り方を習得中なんで、教えて下さい！',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/gakku.png")),filename: 'gakku.png'),
)

User.create!(
  name: 'かいと',
  nickname: 'くいしんぼ',
  email: 'mogu@gmail.com',
  password: 'hG589Etee3x',
  introduction: '名前通り、食べるのが専門。簡単に作れるアレンジレシピを教えてほしいです。',
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/mogu.png")),filename: 'mogu.png'),
)

Tag.create!(
  name: "パスタ"
)

Tag.create!(
  name: "カレー"
)

Tag.create!(
  name: "ご飯もの"
)

Tag.create!(
  name: "パン"
)

Tag.create!(
  name: "下準備"
)


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
      user_id: 4,
      title: "カツサンド",
      introduction: "とんかつとキャベツを詰め込んだカツサンドを作りました。\r\nからしバターがアクセントになって、パクパク食べられちゃうおいしさ！\r\nドライブや、ピクニックや遠足におすすめのひと品です♪",
      material: "豚ロース肉(とんかつ用)……2枚、食パン(6枚切り)……4枚、キャベツ……2枚、バター……20g、\r\n練りがらし……小さじ1杯、中濃ソース……適量\r\n(a)[ 塩こしょう……少々(下味用),小麦粉……適量,溶き卵……1個分,パン粉……適量,サラダ油(揚げ用)……適量 ]",
      amount: "",
      flow: "①下準備として、キャベツは千切りに、食パンは耳を切り落とします。\r\n②豚肉は赤身と脂身の間に数か所切り込みを入れて筋切りをします。\r\n包丁の背で軽くたたいて両面に塩こしょうを振ります。\r\n③②を小麦粉、溶き卵、パン粉の順につけて軽く押さえます。\r\n③170℃の揚げ油に入れ、きつね色になったら裏返し、さらに3分揚げてしっかりと油を切って取り出します。\r\n④食パンの片面にからしバターをぬり、ぬった面に中濃ソースをかけたとんかつとキャベツをのせ、もう1枚の食パンで挟みます。\r\n⑤④をラップに包んで上から軽く押さえ、10分置きます。ラップを取り、半分に切ったら完成です！",
      advise: "豚肉は筋切りすると揚げても反り返らず、食パンに挟みやすくなります。\r\nまた、具材を挟んだ後、ラップで包んでなじませると断面がきれいに仕上がります。"
    },
    {
      user_id: 5,
      title: "鶏むね肉の香味漬け(料理の下準備)",
      introduction: "下味の付いた鶏むね肉を作りだめしようと思って、レシピにも残します。出来上がったものをそのまま焼いても、炊き込みご飯にしても、おかずとして使ってもいい一品！",
      material: "鶏むね肉（皮を取る）……1枚（約300g） a. 酒……大さじ1杯、 a. ごま油……大さじ1杯、 a. 顆粒鶏がらスープの素……小さじ1杯、 a. おろしにんにく……小さじ1/4杯、 a. おろししょうが……小さじ1/4杯",
      amount: "",
      flow: "①鶏むね肉を繊維に沿ってそぎ切りにします。②aの調味料をよく混ぜ合わせます。③冷凍用保存袋に①と②を入れ、なじませます。④冷凍用保存袋の空気を抜きながら平らにして、ジップの入り口を閉めます。⑤冷凍したら、下準備完成です！",
      advise:"再冷凍は、うま味や食感を損なうので避けましょう。冷凍保存袋は、一回に使う量で分けておくと便利です！"
    },
    {
      user_id: 4,
      title: "チキンと野菜のカレーライス",
      introduction:"ご飯にもパンにも合うスープ風カレー。野菜は季節のものを使っています。",
      material: "鶏モモ肉……1枚(250g)、にんにく……ひとかけら、塩・こしょう……少々、タマネギ(小)……1個、(a)ローリエ……1枚、水……200㏄、ウスターソース……小さじ1/2杯、カレー粉……大さじ1/2杯、ブロッコリー……1/4個、オリーブオイル……大さじ1杯",
      amount: "",
      flow: "準備として、まずタマネギを薄くスライスしておきます。次に鶏モモ肉を一口サイズに切り、塩・こしょうをふります。\r\n油を引いたフライパンでこんがり焼き色が付くまで焼きます。焼けたお肉の余分な油を軽く拭き取り、カレー粉を炒めます。\r\n②鍋ににんにくとタマネギを投入し、しんなりなるまで炒めます。\r\n③(a)の調味料を入れ、ブロッコリー(追加したい野菜)も入れて、7分間中火で煮ます。\r\n④下準備で炒めたカレー粉と鶏モモ肉を追加して、弱中火で5分間煮込みます。\r\n⑤器を用意し、ご飯の上に盛り付けて、完成！",
      advise: "カレー粉を炒める際、油が多いと跳ねるので注意。味の濃さは、塩こしょうで調整してみて下さい。"
    },
    {
      user_id: 3,
      title: "むき身で簡単！あさりご飯",
      introduction: "缶詰のあさりのむき身で、下処理をせずに簡単にアサリご飯が作れます。",
      material: "米……2合、あさり水煮缶……2缶、しょうが……1片、a. 酒…大さじ1杯、a. みりん…大さじ1杯、a. しょうゆ…大さじ1杯、a. 塩…ひとつまみ、小口ねぎ……適量",
      amount: "",
      flow: "下ごしらえ・米を水で洗い、30分浸水させてしっかり水気を切ります。・しょうがは千切りにします。\r\n①あさり缶をあさりの身と汁に分けます。②内釜に米、あさり缶の煮汁、しょうが、(a) を入れ、2合のメモリまで水を入れて、炊飯します。\r\n③炊き上がったら、あさりの身を加えて混ぜ合わせます。\r\n④器に盛り、小口ねぎを散らして完成です。",
      advise: "炊く時にあさりの煮汁は一緒に入れて下さい。あさりの身は最初から入れると硬く縮むので、後から加えて混ぜ合わせて下さい。"
    }
  ]
)