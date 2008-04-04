require 'spec/rake/spectask'

task :generate_grammar do 
  Dir.glob(File.join(File.dirname(__FILE__), 'lib/**/*.treetop')) do |input|
    output = input.pathmap('%X') + ".rb"
    `tt #{input} -o #{output}`
  end
end

task :spec => 'spec:run'

task :default => [:generate_grammar, :spec]

