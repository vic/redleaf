# Usage: rubinous rbx_sexp.rb some.yaml 

require 'yaml' 

file = ARGV.shift

hash = YAML.load(File.read(file))
ARGV.each do |name|
  code = hash[name]
  puts "#{name}:", code.strip.to_sexp.inspect
end


