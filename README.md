# SearchShopApp-api

## 💬 About

近くのお店が検索できるアプリのバックエンドAPIです。
rubyのWebフレームワークRuby on Railsを利用。

## 🌻 Version

||Name|Version|What|
|:-:|:-:|:-:|:-|
|backend|ruby|2.6.3|高級言語|
||Ruby on Rails|5.1.7|Webフレームワーク|
|DB|Postgresql|11.5|データベース|

## 🔰 Install & Setup

#### 1. Dockerのダウンロード

下記より、`Docker For Mac` か `Docker For Windows`をインストールして下さい。  
[https://docs.docker.com/install/](https://docs.docker.com/install/)

#### 2. ソースコードの取得

```bash
git clone https://github.com/katsuomi/SearchShopApp-api.git
cd SearchShopApp-api
```

#### 3. 起動

下記の手順で、コンテナを起動させて下さい。

```bash
# Dockerイメージの作成
$ docker-compose build

# Dockerコンテナの起動
$ docker-compose up -d

# dbの作成
$ docker-compose exec web rails db:create

# migrationの実行
$ docker-compose exec web rails db:migrate

# 確認
$ docker-compose ps
```

