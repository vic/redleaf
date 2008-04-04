require File.expand_path('../spec_helpers', File.dirname(__FILE__))


describe RedLeaf::Ruby::Literals do 
  parsetree_sexp RedLeaf::Ruby::LiteralsParser, 
  File.join(File.dirname(__FILE__), 'literals.yaml')
end

describe RedLeaf::Ruby::Program do 
  parsetree_sexp RedLeaf::Ruby::ProgramParser, 
  File.join(File.dirname(__FILE__), 'program.yaml')
end


