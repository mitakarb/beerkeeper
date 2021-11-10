# README

![Beerkeeper](app/assets/images/logo.svg)

mitaka.rb で作っているイベント管理アプリです :beers:

# 環境構築

- Ruby: 3.0.1
- Rails: 6.1.4
- DB: postgresql

## Use Docker

```shell
$ git clone https://github.com/mitakarb/beerkeeper.git
$ cd beerkeeper
$ docker-compose build
$ docker-compose run --rm web bin/setup
$ docker-compose up
```

## local

```shell
$ git clone https://github.com/mitakarb/beerkeeper.git
$ cd beerkeeper
$ bin/setup
$ bin/rails s
```

## 動作確認
- http://localhost:3000/ を開いてイベント一覧が表示されたらOKです:)
