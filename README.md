# README
環境
* ruby: 2.5.3
* rails: 5.2.2

## init project

```shell
rails new app-name --api --skip-active-record --no-sprockets
```

`--api` : 使用 Rails API mode

`--skip-active-record` : active record is for sql based database, 這邊是用 mongodb, 因此省略安裝

`--no-sprockets` :  確保 rails 不會產生 assets 相關設定檔案

## mongodb

透過 `docker-compose` 來建立 mongodb

設置 volumes 將資料映射到專案路徑下

```yml
version: '3'
services:
  mongo:
    image: mongo:4.1
    container_name: mongo4
    restart: always
    ports:
      - '27017:27017'
    volumes:
      - ./tmp/data/mongo/data:/data/db
```

接著執行 `docker-compsoe up -d` 等候資料庫環境建置

## 設定環境

使用 `mongoid`  與 mongodb 做連線設定

```yml
gem 'mongoid', '~> 7.0.2'
```

執行 `bundle install`

接著執行 `rails generate mongoid:config` ，會在`config/` 下產生設定檔 `mongoid.yml`

建立資料表

```shell
rails db:create
```

## 建立 Model

建立需要的 Model

```shell
rails g model todo title notes dead_line state
```

可以透過 `rails console` 建立資料

```shell
2.5.3 :014 > Todo.create(title: "First", notes: "do something", dead_line: Date.today+20, state: false)
 => #<Todo _id: 5c7ce7d30abeba184e155e2f, title: "First", notes: "do something", dead_line: 2019-03-24 00:00:00 UTC, state: false>

```
