class Dbsh < Thor
  desc 'db_reset', 'Delete and recreate the database'
  def db_reset
    system 'rm test.sqlite3 && sqlite3 test.sqlite3 < schema.sql'
  end
end
