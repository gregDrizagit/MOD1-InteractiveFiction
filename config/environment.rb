require 'bundler/setup'
Bundler.require

require 'active_record'
# require 'rake'
DB = ActiveRecord::Base.establish_connection({
  :adapter => 'sqlite3',
  :database => 'db/if_db.sqlite'
}
)


require_all 'app'
