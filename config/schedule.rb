# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron.log"
set :environment, "development"

# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# require File.expand_path(File.dirname(__FILE__) + "/environment")
# set :output, 'log/cron.log'

# http://d.hatena.ne.jp/kk_Ataka/20160605/1465121213
every 60.minute do
  rake "test"
end

every 60.minute do
  rake "sample"
end
