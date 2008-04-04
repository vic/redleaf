namespace :spec do 

  desc 'Run all specs'
  Spec::Rake::SpecTask.new('run') do |task|
    task.spec_files = FileList['spec/**/*_spec.rb']
    task.spec_opts += ENV['SPEC_OPTS'] if ENV['SPEC_OPTS']
  end

  desc 'Run all specs'
  Spec::Rake::SpecTask.new('spec') do |task|
    task.spec_files = FileList['spec/**/*_spec.rb']
    task.spec_opts << '--options' << 'spec/spec.opts' << '--format' << 'failing_examples:failing'
  end

  desc 'Run all failing examples from previous run'
  Spec::Rake::SpecTask.new('failing') do |task|
    task.spec_files = FileList['spec/**/*_spec.rb']
    task.spec_opts << '--options' << 'spec/spec.opts' << '--format' << 'failing_examples:failing' << '--example' << 'failing'
  end

  directory 'reports'
  desc 'Run RSpec and generate Spec and coverage reports (slow)'
  Spec::Rake::SpecTask.new('reports') do |task|
    task.spec_files = FileList['spec/**/*_spec.rb']
    task.spec_opts << '--format' << 'html:reports/specs.html' << '--backtrace'
    task.rcov = true
    task.rcov_opts = ['--exclude', 'spec,bin']
  end
  task 'reports' do
    mv 'coverage', 'reports'
  end

  task 'clobber' do
    rm 'failing' rescue nil
    rm_rf 'reports'
  end
end
