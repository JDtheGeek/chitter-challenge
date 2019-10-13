require_relative 'database_connection'

class Peeper

  attr_reader :username, :email, :database, :table, :key

  DATABASE = 'chitter'
  TABLE = 'peepers'
  KEY_COLUMN = 'id'
  COLUMNS = '"username", "email", "password"'

  def self.create(username:, email:, password:)
    response = DatabaseConnection.add(
      database: DATABASE,
      table: TABLE,
      columns: COLUMNS,
      values: "'#{username}','#{email}','#{password}'"
    )
    new(
      id: response[0]['id'],
      username: response[0]['username'],
      email: response[0]['email']
    )
  end

  def initialize(id:, username: nil, email: nil)
    @database = DATABASE
    @table = TABLE
    @key_column = KEY_COLUMN
    @primary_key = id
    @columns = COLUMNS
    @id = id
    @username = username
    @email = email
  end
end