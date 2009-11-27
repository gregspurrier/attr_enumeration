require 'spec'
require 'activerecord'
require File.join(File.dirname(__FILE__), '../init')

# Connect to the test database
db_config_file = File.join(File.dirname(__FILE__), 'db/config.yml')
db_config = File.open(db_config_file) { |f| YAML.load(f) }
ActiveRecord::Base.establish_connection(db_config)

class TestObject < ActiveRecord::Base
  attr_enumeration :color => [:red, :green, :blue]
end
