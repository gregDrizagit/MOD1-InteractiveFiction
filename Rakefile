require_relative './config/environment'
require 'sinatra/activerecord/rake'


task :console do
  Pry.start
end

task :run do
  system "ruby lib/run.rb"
end

namespace :db do
  task :reset_room_keys do
    ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence WHERE name = 'rooms'")
  end
  task :reset_user_keys do
    ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
  end
end
