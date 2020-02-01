# SearchShopApp-backend

## 💬 About

This repository is backend API on SearchShopApp,which can find nearby restaurants.

## 🌻 Version

||Name|Version|What|
|:-:|:-:|:-:|:-|
|backend|ruby|2.6.3|High-level languages|
||Ruby on Rails|5.1.7|Web FrameWork|
|DB|Postgresql|11.5|database|

## 🔰 Install & Setup

#### 1. Download Docker

The following procedure, please install Docker For Mac or Docker For Windows

[https://docs.docker.com/install/](https://docs.docker.com/install/)

#### 2. Getting source code

```bash
$ git clone https://github.com/katsuomi/SearchShopApp-backend.git
$ cd SearchShopApp-backend
```

#### 3. Start-up

The following procedure, start the container.
```bash
# Create Docker image
$ docker-compose build

# Run Docker container
$ docker-compose up

# create DB
$ docker-compose exec backend rails db:create

# migration
$ docker-compose exec backend rails db:migrate

# test
$ docker-compose exec backend rspec

# confirm
$ docker-compose ps
```

If the following local server started, it's ok.

|host||
|:-:|:-:|
|backend|[http://localhost:3000](http://localhost:3000)|
|swagger|[http://localhost:3001](http://localhost:3001)|
|db|tcp:5432|
