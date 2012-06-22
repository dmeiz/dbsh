require 'rubygems'
require 'readline'
require 'sequel'
require 'sqlite3'
require 'terminal-table'
require 'yaml'

#DB = Sequel.oracle 'cink', :user => 'dhensgen', :password => '...'
#puts DB.fetch('select count(1) from prod_sched').first

config = YAML.load(File.read("#{ENV['HOME']}/.dbsh"))[ARGV[0]]
DB = Sequel.connect(config)

#Example ~/.dbsh:
#dbsh_test:
#  adapter: sqlite
#  database: test.sqlite3
# 
## :adapter=>'postgres', :host=>'localhost', :database=>'blog', :user=>'user', :password=>'password'

def statement_type(statement)
  case statement
    when /\s*select/i then :select
    when /\s*insert/i then :insert
    when /\s*update/i then :update
    when /\s*delete/i then :delete
    when /\s*\\/i then :command
    else nil
  end
end

while line = Readline.readline('> ', true)
  begin
    case statement_type(line)
    when :select
        dataset = DB[line]
        table = Terminal::Table.new(:headings => dataset.columns) do |t|
          dataset.each do |row|
            t.add_row(dataset.columns.map {|col| row[col]})
          end
        end
      puts table
    when :insert
      DB[line].insert
      puts 'Inserted row'
    when :update
      puts "Updated #{DB[line].update} rows"
    when :delete
      puts "Deleted #{DB[line].delete} rows"
    when :command
      exit(0) if line =~ /\\q/
    else
      puts 'Unknown statement type'
    end
  rescue Sequel::DatabaseError => e
    puts 'Error: ' + e.message
  end
end

__END__

OVERVIEW

  A clone of mysql cli with these enhancements:

X   * Connect to multiple database types
    * Named connections
    * Improved editor-execute loop
    * Implemented in Ruby

  Beyond MVP:

    * Color output
    * Parameterized sql scripts
    * Column filtering

MVP

X  Connect to databases by name:
X
X    $ dbsh rockwell_dev
X    ~/.dbsh:
X      rockwell_dev:
X        adapter: mysql
X        username: root
X        password:
X        database: rockwell_dev

X  Connect to different types of databases:
X
X    * mysql
X    * oracle
X    * sqlite
X    * postgres

X  Execute sql:
X
X    > select * from illustrations;
X    id  name     updated_at
X    --  -------  ----------
X    10  Filmore  2012-06-12
X
X    > delete from illustrations;
X    Deleted 1 row.

X  Quit:
X
X    > \q
X    $

X  Report errors:
X
X    > foo;
X    ERROR: What is foo?

  Install:

    $ gem install dbsh

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

  Edit and run a sql script:

    > \e illustrations.sql
    (open script in $EDITOR, execute script if changes were made)
