require 'rubygems'
require 'readline'
require 'sequel'

DB = Sequel.oracle 'cink', :user => 'dhensgen', :password => '...'

puts DB.fetch('select count(1) from prod_sched').first

#while line = Readline.readline('> ', true)
#  DB.fetch(line).each do |row|
#    puts row
#  end
#end

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
