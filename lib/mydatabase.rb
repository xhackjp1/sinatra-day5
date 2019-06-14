require 'pg'
require 'dotenv/load'

module Mydatabase
  def exec(sql)
    conn = PG::connect(
      host: ENV['DATABASE_HOST'],
      user: ENV['DATABASE_USER'],
      password: ENV['DATABASE_PASSWORD'],
      dbname: ENV['DATABASE_NAME'],
      port: ENV['DATABASE_PORT']
    )
    # sqlを実行する
  	data = conn.exec(sql)
    conn.finish
    return data
  end
  module_function :exec
end
