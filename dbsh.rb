require 'rubygems'
require 'readline'
require 'sequel'
require 'terminal-table'

#DB = Sequel.oracle 'cink', :user => 'dhensgen', :password => '...'
#puts DB.fetch('select count(1) from prod_sched').first

DB = Sequel.sqlite 'test.sqlite3'

def statement_type(statement)
  case statement
    when /\s*select/i then :select
    when /\s*\\/i then :command
    else nil
  end
end

while line = Readline.readline('> ', true)
  case statement_type(line)
  when :select
    begin
      dataset = DB[line]
      table = Terminal::Table.new(:headings => dataset.columns) do |t|
        dataset.each do |row|
          t.add_row(dataset.columns.map {|col| row[col]})
        end
      end
    rescue Sequel::DatabaseError => e
      puts e
    end
    puts table
  when :command
    exit(0) if line =~ /\\q/
  else
    puts 'Unknown statement type'
  end
end

__END__

OVERVIEW

  A clone of mysql cli with these enhancements:

    * Connect to multiple database types
    * Named connections
    * Improved editor-execute loop
    * Implemented in Ruby

  Beyond MVP:

    * Color output
    * Parameterized sql scripts
    * Column filtering

MVP

  Install:

    $ gem install dbsh

  Connect to databases by name:

    $ dbsh rockwell_dev
    ~/.dbsh:
      rockwell_dev:
        adapter: mysql
        username: root
        password:
        database: rockwell_dev

  Connect to different types of databases:

    * mysql
    * oracle
    * sqlite
    * postgres

  Execute sql:

    > select * from illustrations;
    id  name     updated_at
    --  -------  ----------
    10  Filmore  2012-06-12

    > delete from illustrations;
    Deleted 1 row.

    > foo;
    ERROR: What is foo?

  Readline support:

    * History
    * Edit line

  Execute a sql script:

    > \. illustrations.sql
    ...

  Execute a sql script from the command line:

    $ dbsh rockwell_dev < illustrations.sql
    ...

  Explore the database:

    > show tables;
    name
    -------------
    illustrations
    builds

    > desc illustrations;
    name       type
    ---------- ------------ 
    id         integer
    name       varchar(256)
    updated_at datetime

  Quit:

    > \q
    $

  Edit and run a sql script:

    > \e illustrations.sql
    (open script in $EDITOR, execute script if changes were made)
