# アプリケーションの概要 
玄米レシピに合ったレシピを投稿・検索できるwebサイト

https://genmai-recipe.site/

# 技術的ポイント
* Dockerを利用した開発
* インフラとしてAWS EC2を利用
* RspecでModel、Reauest、Systemテスト記述（計143テスト）
* Ajaxを用いた非同期処理（フォロー/未フォロー、お気に入り登録/未登録などの切り替え表示）
* Bootstrapによるレスポンシブ対応
* 7つのモデルをそれぞれ関連付けて使用

# 使用技術
* Ruby 2.6.5  
* Ruby on Rails 6.1.4
* Postgresql バージョン
* Nginx
* Puma
* AWS
    * VPC
    * EC2
    * RDS
    * Route53  
* Docker/Docker-compose
* Rspec  

# アプリケーション機能一覧  
* ユーザー登録、ログイン機能（devise）  
* レシピの投稿機能
    * 画像投稿（Active Storage）
* お気に入り機能（Ajax）
* コメント機能
* フォロー機能
* ページネーション機能（kaminari）
* すべてのレシピおよびフォローユーザーのレシピそれぞれのレシピ検索機能（ransack）  

# テスト  
* Rspec  
    * 単体テスト（model）
    * 機能テスト（request）
    * 統合テスト（system）