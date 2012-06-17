require 'rubygems'
require 'terminal-table'

table = Terminal::Table.new(:headings => ['foo', 'bar']) do |t|
  t.add_row ['wam', 'bam']
end

puts table
