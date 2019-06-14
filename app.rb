require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'aws-sdk-s3'
require './lib/mydatabase' # moduleの読み込み
require './lib/image_uploader' # classの読み込み

get '/' do
  @data = Mydatabase.exec('select * from board_contents;')
  erb :index
end

post '/comments' do
  name = params['name']
  comment = params['comment']
  # sqlを組み立てる
  sql = "INSERT INTO board_contents (name, comment) VALUES ('#{name}', '#{comment}');"
  # sqlを実行する
  @data = Mydatabase.exec(sql)
  redirect '/'
end

get '/signin' do
  # viewsの下に階層を作りたい場合はシングルクォートで囲む
  erb :'login/new'
end

get '/test' do
  erb :image
end

post '/upload' do
  upload_image = params[:file]
  uploader = ImageUploader.new(upload_image)
  uploader.upload_image
  redirect '/'
end
