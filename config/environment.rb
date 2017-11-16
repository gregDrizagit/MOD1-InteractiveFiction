require 'bundler/setup'
Bundler.require
require_relative '../lib/game_data_management.rb'
require_relative '../lib/make_user.rb'
require_relative '../lib/greeting.rb'
require_relative '../lib/item_management.rb'
require_relative '../lib/room_management.rb'

require 'active_record'
# require 'rake'
ActiveRecord::Base.logger = nil
DB = ActiveRecord::Base.establish_connection({
  :adapter => 'sqlite3',
  :database => 'db/if_db.sqlite'
}
)


require_all 'app'
