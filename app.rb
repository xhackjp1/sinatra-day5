require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'pg'
require 'aws-sdk-s3'
require './lib/mydatabase' # moduleの読み込み
require './lib/image_uploader' # classの読み込み
require './lib/sendmail' # classの読み込み
require './models'

set :database_file, "./database.yml"

get '/' do
  @data = BoardContent.all
  erb :index
end

post '/comments' do
  name = params['name']
  comment = params['comment']
  # sqlを組み立てる
  BoardContent.create(name: name, comment: comment)
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
  Sendmail.send_message("smatsuda@x-hack.jp", "おはよう", "テスト : " + uploader.public_url)
  redirect '/'
end
