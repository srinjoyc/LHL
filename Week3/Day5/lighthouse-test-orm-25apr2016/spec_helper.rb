require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'pry'
require 'active_record'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

require './models/library'
require './models/book'
require './models/lend'

require './factories/libraries'
require './factories/books'
require './factories/lends'

# Connect to the DB
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/db.sqlite3'
)

# Recreate the database
ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

I18n.enforce_available_locales = false
