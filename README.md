# Torioki_Recipe

![DISH×RECIPE (1)](https://user-images.githubusercontent.com/106646758/187017213-e1a99488-b11e-429e-af4a-a8643e04fbf3.png)

Torioki_Recipeは料理のレシピを通してお気に入りの料理やノウハウを探し集めるサイトです。

## テーマを選んだ背景
　一人暮らしを始めたばかりのとき、少しでも節制しようと「とりおきおかず」を定期的に作っていたのですが、<br>
レパートリーを増やすのに苦戦したり、親から教わってこなかった食材の下ごしらえや当たり前の知識がなくて<br>
食材をダメにした経験があり、その時に「普段投稿されているレシピに、直接料理の注意点などが後書きできる」<br>
サイトがあったら使うのになと思った事があり、今回このテーマを選びました。<br>

　昨今、時短料理が話題になり、料理本や料理番組・投稿動画をよく見かけるようになり、料理が浸透しているように思います。<br>
しかし、周りの声を聴いてみると、料理の仕方を知らず、いざ作ろうとしても適応できない人が一定数いたのです。<br>
ご飯を炊くこと以外できない人、包丁の使い方が分からない人、親の手料理を食べた事がない人。<br>
様々な状況下にいて料理を知らない人々が、料理のノウハウを知り、料理を知る人に気軽に聞ける場所が必要だと感じました。<br>

　料理の仕方を学びたい人や料理の事を教えたい人が、サイトの中で交流し合えるのではないかと考え作成しました。

## ターゲットユーザ
- 料理の仕方が分からない、苦手な人
- 料理のレパートリーに困っている人
- 料理を教えたい、料理を通して仲間を作りたい人

## 主な利用シーン
- 料理の仕方を知りたいとき
- レシピや料理を共有したいとき
- 新しい料理を模索しているとき

# 実装機能
## 基本機能一覧
| | 機能 | Gem |
|:-:|:-:|:-:|
|1|CRUD機能||
|2|管理者機能|devise|
|3|会員機能|deivse|
|4|退会機能||
|5|画像投稿/処理|ActiveStorage/ImageMagick|
|6|デバッグ|pry-byebug,pry-rails|

## サイトを見やすくする機能
||機能|Gem|
|:-:|:-:|:-:|
|1|複数タグ付け||
|2|検索(タグとキーワード)|ransack|
|3|ランキング機能||
|4|Bookmark(Ajax)||
|5|コメント||
|6|通知機能||
|7|Pagination|kaminari|
|8|Bootstrap||
||devise日本語化|rails-i18n|

## 設計書
- [ER図](https://app.diagrams.net/#G19IT4eb-ODjpnKxVwaQqhCoQIzikn0yAO)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1_RG8K9y7yeDuKJj9YIw1XFF6M2Hqrjxr1tLJaWPnFFk/edit#gid=1373217982)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1lDUJL8e82KvzuksykRMzJr56p5FeuLPuo7mrQIVGZZw/edit#gid=868872552)

## 開発環境
- OS: Linux(CentOS)
- 言語: HTML,CSS,Javascript,Ruby,SQL
- フレームワーク: Ruby on Rails
- JSライブラリ: jQuery
- IDE: Cloud9

## 本番環境
- AWS(EC2、RDS)
- Nginx、Puma

## 使用素材
- [pexel](https://www.pexels.com/ja-jp/)
- [canva](https://www.canva.com/)
- [unDRAW](https://undraw.co/)

## 制作の記録
- [スクールの発表スライド](https://docs.google.com/presentation/d/1EkfBcAUMNnDPgaRKach1_kmOhDON1AYuHhHrUleNDt8/edit#slide=id.gc6f80d1ff_0_0)