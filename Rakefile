require "sinatra/activerecord/rake"

task default: %w[test sample]

task :test do
  ruby "test/unittest.rb"
end

task :sample do
  ruby "test/sample.rb"
end

task :db_create do
  ruby "db/migrate/create_board_contents.rb"
end

task :scraping do
  ruby "test/scraping.rb"
end

namespace :db do
  task :load_config do
    require "./app"
  end
end
