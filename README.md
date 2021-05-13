# README

![Beerkeeper](app/assets/images/logo.svg)

mitaka.rb で作っているイベント管理アプリです :beers:

# 環境構築

- Ruby: 2.6.x
- Rails: 6.0.x
- DB: postgresql

## Use Docker

```shell
$ git clone https://github.com/mitakarb/beerkeeper.git
$ cd beerkeeper
$ docker-compose up
$ docker-compose run web bin/rails db:setup
```

## local

```shell
$ git clone https://github.com/mitakarb/beerkeeper.git
$ cd beerkeeper
$ bin/setup
$ bin/rails s
```
