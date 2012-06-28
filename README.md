# Dbsh

A database console like psql. This is a proof of concept; use at your own risk.

## Installation

    $ gem install dbsh

## Usage

Define a connection in `~/.dbsh`:

    mydb:
      adapter: mysql
      host: localhost
      username: root
      password: password
      database: mydb

Then run `dbsh` with your connection:

    $ dbsh mydb

And ask dbsh for help:

    > \h

Dbsh uses [Sequel](http://sequel.rubyforge.org/) for database access, so you
should be able to connect to anything Sequel can. You'll probably need to
install [the right database
gem](http://sequel.rubyforge.org/rdoc/files/doc/opening_databases_rdoc.html) to
get connected.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
