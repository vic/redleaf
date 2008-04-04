require 'rubygems'
require 'parse_tree'
require 'yaml'

all_nodes = !ENV['PT_ALL'].nil?

file = ARGV.shift

hash = YAML.load(File.read(file))
ARGV.each do |name|
  code = hash[name]
  puts "#{name}:"
  parse_tree = ParseTree.new(all_nodes)
  sexp = parse_tree.parse_tree_for_string(code.strip).first
  puts sexp.inspect
end

