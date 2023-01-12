# README

![Beerkeeper](app/assets/images/logo.svg)

mitaka.rb で作っているイベント管理アプリです :beers:

# 環境構築

- Ruby: 3.2.0
- Rails: [`main`](https://github.com/rails/rails/tree/main)
- DB: postgresql

## Use Docker

```shell
# beerkeeperのDocker環境を過去に作ったことがあり、まっさらにしたい時
$ docker-compose down --volumes

# まっさらな状態からやるとき
$ git clone https://github.com/mitakarb/beerkeeper.git
$ cd beerkeeper
$ docker-compose build
$ docker-compose run --rm web bin/setup
$ docker-compose up
# http://localhost:3000/ を確認

# test
## 初回のみ
$ docker-compose run --rm -e RAILS_ENV=test web bin/rails db:test:prepare
## spec実行
$ docker-compose run --rm -e RAILS_ENV=test web bundle exec rspec
```

## local

```shell
$ git clone https://github.com/mitakarb/beerkeeper.git
$ cd beerkeeper
$ bin/setup
$ bin/dev
# http://localhost:3000/ を確認
```

## 動作確認
- http://localhost:3000/ を開いてイベント一覧が表示されたらOKです:)
