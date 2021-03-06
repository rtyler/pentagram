require 'fileutils'
require 'temp_dir'

require 'blimpy'
require 'blimpy/cli'

Before do
  # Before every scenario, we want to create a temporary directory that
  # will become our fake-root for running Blimpy commands and other things
  # within the context of the Scenario
  @original_dir = Dir.pwd
  @dir = TempDir.create(:basename => 'pentagram')
  Dir.chdir(@dir)

  # Set up the modules symlink
  FileUtils.ln_s(File.join(@original_dir, '/modules'),
                 File.join(@dir, '/modules'))

  # Copy the bootstrap.sh into the temporary directory so
  # Blimpy can find and use it properly
  FileUtils.cp(File.join(File.dirname(__FILE__), '/bootstrap.sh'),
               @dir)
  FileUtils.chmod(0755, File.join(@dir, '/bootstrap.sh'))

  puts "Using temp dir: #{@dir}"
end

After do |scenario|
  fleet = Blimpy::Fleet.new
  fleet.destroy

  # After each scenario, regardless of whether it failed or not we should
  # change back to the original directory we started in
  unless @original_dir.nil?
    Dir.chdir(@original_dir)
  end
end
