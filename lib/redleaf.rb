require 'rubygems'
require 'treetop'
require 'redleaf/ruby'

module RedLeaf

  class << self
    def sexp(ruby)
      parser = RubyParser.new 
      unless node = parser.parse(ruby)
        raise parser.failure_reason unless node
      end
      node.sexp
    end
  end
  
end

