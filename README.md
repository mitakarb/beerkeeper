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
$ docker-compose build
$ docker-compose ps
$ docker-compose run --rm web yarn install --check-files
$ docker-compose run --rm web rails db:create
$ docker-compose run --rm web rails db:migrate
$ RAILS_ENV=development
$ docker-compose up
```

## local

```shell
$ git clone https://github.com/mitakarb/beerkeeper.git
$ cd beerkeeper
$ bin/setup
$ bin/rails s
```
