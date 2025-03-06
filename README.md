#■旅シェア
サービスURL：[https://www.tabishare.com/](https://www.tabishare.com/)
![logo](imageslogo.png)

##■サービス概要
建築物や観光名所に特化した検索・投稿サービスです。
ユーザー同士で、行って良かった観光地や建築物をシェアし合い、旅行先の選択肢を広げることができます。
　
##■ このサービスへの思い・作りたい理由
旅行が好きで、知名度の高い観光地から穴場のスポットまで簡単に検索できるサービスを作りたいと考えました。
私は旅行に訪れる際、SNSで訪れる観光地、地域サイトや観光サイトでは営業時間や料金を調べていました。
そんな中で、穴場スポットを知るSNSと公式情報を提供する観光サイトが一つになったサービスがあれば便利だと思い、このサービスを作成しました。
　
##■ ユーザー層について
10代〜30代の男女を対象にしています。
10代〜30代は旅行や観光に行くことが多いと思いますし、普段からSNSやネットなどを利用することが多くこのサービスを有効的に活用していただけると思います。
　
##■機能一覧 (※はログインが必要機能)

###トップ画面
<video controls>
  <source src="https://gyazo.com/8f02065da8ec5f2dae2f3cd00e2e0626.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
投稿一覧やサービス概要が表示されています。

###サインアップ画面
![サインアップ画面](https://gyazo.com/7cddcf0a3c6f2605ec27d1c26572255e/raw)
お名前、ニックネーム、メールアドレス、パスワードでサインアップできます。

###ログイン画面
![ログイン画面](https://gyazo.com/d4ec9f461c18fe23dcc023745c703f2e/raw)
メールアドレス、パスワードでログインできます。

###投稿詳細
![投稿詳細](https://gyazo.com/362a603534c31c68cd2279d09660af67/raw)
タイトル、写真、観光サイトURL、投稿者、Mapを表示しています。

###検索機能
<video controls>
  <source src="https://gyazo.com/39ab9ddb2a3a63048da37825c8903a60.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
検索したいワードで検索できます

###ハッシュタグ機能
<video controls>
  <source src="https://gyazo.com/126403b86fbdc307f0ea5f8ed2a81e58.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
投稿のハッシュタグを押すとハッシュダグ一覧が表示されます。

###LINE共有
<video controls>
  <source src="https://gyazo.com/cf6e974797244d34e4c030d0f69595b9.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
共有したい投稿を共有できます。

###*投稿作成・編集
![投稿作成・編集](https://gyazo.com/37947beb69541248d2c94370b6e7a08b/raw)
タイトル、観光サイトURL、ハッシュタグ、住所、写真を投稿、編集できます。

###*プロフィール編集
![投稿作成・編集](https://gyazo.com/db87a27859426496efc04080fdbedb5b/raw)
お名前、ニックネーム、メールアドレス、アイコン写真を編集できます。

###ブックマーク
動画
気に入った投稿をブックマークし、ブックマーク一覧で確認できます。

##■サービス利用イメージ
###ログイン前の場合
トップ画面から検索機能やハッシュタグ機能利用し気になる投稿を検索
　　　　　　　　　　　　　　↓
投稿の詳細を確認し住所や観光サイトURLから情報を得る
　　　　　　　　　　　　　　↓
お気に入りの投稿をLINE共有を利用し友人に共有
###ログイン後の場合
プロフィール写真を設定しプロフィールを完成させる
　　　　　　　　　　　　　　↓
シェアしたい観光地、建築物の情報を記載して投稿
　　　　　　　　　　　　　　↓
自分の投稿詳細に確認し誤りがあれば編集、必要なくなれば削除
　　　　　　　　　　　　　　↓
投稿一覧から検索機能やハッシュタグ機能利用し気になる投稿を検索
　　　　　　　　　　　　　　↓
気に入った投稿をブックマークしブックマーク一覧を確認

##■サービスの差別化ポイント
###写真を投稿しシェアするアプリとしてInstagram、Xなどが存在しますが、以下の点で差別化しています。
・投稿詳細にMapや観光地公式サイトのURLを表示しています。
・サインアップ、ログインしていなくても投稿を見れることができ、LINE共有、検索機能を使用できます。

##■サービスの差別化ポイント
| フロントエンド | Rails 8.0|
| バックエンド | Rails 8.0 (Ruby 3.3.6)|
| CSSフレームワーク | Bootstrap |
| インフラ | heroku / AmazonS3 |
| DB | MySQL |
| 開発環境 | Docker |
| 認証 | Sorcery |
| CI/CD | GitHub Actions |
| Web API | GoogleMap API |

##■画面遷移図（企画時）
[画面遷移図のFigmaリンク](https://www.figma.com/board/wAEYVokzlSBkkWqeBQFiFp/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3%EF%BC%88%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9C%EF%BC%89?node-id=0-1&t=ftjHaJpMuhfAUEBK-1)

##■ER図
![ER図](https://gyazo.com/81150f33eda80526904918e597c9fa82/raw)
