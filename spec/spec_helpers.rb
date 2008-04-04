
$:.unshift File.expand_path('../lib', File.dirname(__FILE__))

require 'rubygems'
require 'redleaf'
require 'yaml'
require 'parse_tree'

module RedLeaf
  class RubyExampleGroup < Spec::Example::ExampleGroup
    class << self

      def parsetree_sexp(parser_class, examples_yaml, *names)
        options = Hash === names.last ? names.pop : {}
        all_nodes = options[:all_nodes] || false
        includes, excludes = [], []
        names.each do |name|
          if /^!/ === name 
            excludes << name[1..-1]
          else
            includes << name
          end
        end
        hash = YAML.load(File.read(examples_yaml))
        hash.each_pair do |name, code|
          next if excludes.any? { |e| e === name.to_s }
          next unless includes.any? { |e| e === name.to_s } unless includes.empty?
          it "should parse #{name}" do
            parse_tree = ParseTree.new(all_nodes)
            sexp = parse_tree.parse_tree_for_string(code.strip, name).first
            parser = parser_class.new
            result = parser.parse(code.strip)
            fail "No match for \n#{code}: "+parser.failure_reason unless result
            result.sexp.should == sexp
          end
        end
      end
    end

    Spec::Example::ExampleGroupFactory.register(:ruby, self)
  end
  
end
