require 'pg'

def setup_test_database
  # p "setting up an empty test database..."

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("DROP TABLE peeps CASCADE;")
  connection.exec("DROP TABLE peepers CASCADE;")

  connection.exec("CREATE TABLE peepers(id serial PRIMARY KEY, username VARCHAR (50) UNIQUE NOT NULL, email VARCHAR (355) UNIQUE NOT NULL, password VARCHAR (50) NOT NULL, created_on TIMESTAMPTZ NOT NULL DEFAULT NOW());")
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peeper_id integer REFERENCES peepers(id), content VARCHAR(140) NOT NULL, created_on TIMESTAMPTZ NOT NULL DEFAULT NOW());")
end