desc 'Create the test database'
task :create_db do
  require 'activerecord'
  db_config_file = File.join(File.dirname(__FILE__), 'spec/db/config.yml')
  db_config = File.open(db_config_file) { |f| YAML.load(f) }
  ActiveRecord::Base.establish_connection(db_config)

  require File.join(File.dirname(__FILE__), 'spec/db/schema.rb')
end
