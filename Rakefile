require 'rspec/core/rake_task'

RSPEC_OPTS = '--color --fail-fast'

namespace :spec do
  namespace :modules do
    Dir.glob('modules/*') do |p|
      if File.directory?(File.join(p, 'spec'))
        name = File.basename(p)
        desc "Run rspec-puppet tests for the #{name} module"
        task name.to_sym do |t|
          sh "cd #{p} && rspec #{RSPEC_OPTS}"
        end
      end
    end
  end
end
