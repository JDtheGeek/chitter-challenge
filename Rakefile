require 'pg'

if ENV['RACK_ENV'] = 'test'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end


task :drop_chitter_database do
  connection = PG.connect
  connection.exec('DROP DATABASE chitter;')
end

task :drop_chitter_test_database do
  connection = PG.connect
  connection.exec('DROP DATABASE chitter_test;')
end

task install: [:create_peepers_table, :create_peeps_table, ] do
  p "Done"
end

task install_test: [:create_test_peepers_table, :create_test_peeps_table, ] do
  p "Done"
end

task :create_chitter_database do
  p 'Creating Database: chitter'
  connection = PG.connect
  connection.exec("CREATE DATABASE chitter;")
end

task create_peepers_table: [:create_chitter_database] do
  p 'Creating Table: peepers'
  connection = PG.connect(dbname: 'chitter')
  connection.exec("CREATE TABLE peepers(id serial PRIMARY KEY, username VARCHAR (50) UNIQUE NOT NULL, email VARCHAR (355) UNIQUE NOT NULL, password VARCHAR (50) NOT NULL, created_on TIMESTAMPTZ NOT NULL DEFAULT NOW());")
end

task create_peeps_table: [:create_chitter_database, :create_peepers_table] do
  p 'Creating Table: peeps'
  connection = PG.connect(dbname: 'chitter')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peeper_id integer REFERENCES peepers(id), content VARCHAR(140) NOT NULL, created_on TIMESTAMPTZ NOT NULL DEFAULT NOW());")
end

# Test Database
task :create_chitter_test_database do
  p 'Creating Database: chitter_test'
  connection = PG.connect
  connection.exec("CREATE DATABASE chitter_test;")
end

task create_test_peepers_table: [:create_chitter_test_database] do
  p 'Creating Table: peepers'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("CREATE TABLE peepers(id serial PRIMARY KEY, username VARCHAR (50) UNIQUE NOT NULL, email VARCHAR (355) UNIQUE NOT NULL, password VARCHAR (50) NOT NULL, created_on TIMESTAMPTZ NOT NULL DEFAULT NOW());")
end

task create_test_peeps_table: [:create_chitter_test_database, :create_test_peepers_table] do
  p 'Creating Table: peeps'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peeper_id integer REFERENCES peepers(id), content VARCHAR(140) NOT NULL, created_on TIMESTAMPTZ NOT NULL DEFAULT NOW());")
end