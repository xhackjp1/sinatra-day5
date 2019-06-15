# sinatra-day5

## 事前準備

1. postgresデータベースを作成し、データベースアクセス情報を取得しておく
2. AWSにてバケットを作成し、アクセスキーID、シークレットアクセスキーを取得しておく
3. リポジトリを任意のディレクトリにcloneする

```
$ git clone https://github.com/x-hack-git/sinatra-day5
$ cd sinatra-day5
$ bundle install --path bendor/bundle
```

4. ターミナルで下記のコマンドを実行

```
$ cp example.env .env
```

5. .envファイルを修正

```
DATABASE_HOST='xxx.amazonaws.com'
DATABASE_USER=''
DATABASE_PASSWORD=''
DATABASE_NAME=''
DATABASE_PORT='5432'
AWS_S3_ACCESS_KEY_ID=''
AWS_S3_SECRET_ACCESS_KEY=''
AWS_S3_BUCKET_NAME=''
```

6. ターミナルで下記のコマンドを実行

```
$ ruby app.rb
```

7. [http://localhost:4567](http://localhost:4567) にアクセス

## Rakeタスク実行

```
$ rake [タスク名]
```

## 定期実行

- 登録
```
$ bundle exec whenever --update-crontab
```

- 確認
```
$ bundle exec whenever
```
