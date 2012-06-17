require 'temp_dir'


Before do
  # Before every scenario, we want to create a temporary directory that
  # will become our fake-root for running Blimpy commands and other things
  # within the context of the Scenario
  @original_dir = Dir.pwd
  @dir = TempDir.create(:basename => 'pentagram')
  Dir.chdir(@dir)
end

After do |scenario|
  # After each scenario, regardless of whether it failed or not we should
  # change back to the original directory we started in
  unless @original_dir.nil?
    Dir.chdir(@original_dir)
  end
end
