Given /^an empty host$/ do
  # XXX: This should go into a Blimpy cucumber helper somehow
  File.open('Blimpfile', 'w') do |fd|
    fd.write("""
Blimpy.fleet do |fleet|
  fleet.add(:aws) do |ship|
    ship.name = 'pentagram-cucumber'
    ship.livery = :cwd
    ship.flavor = 'm1.small'
    ship.ports = [22, 80]
  end
end
""")
  end
end

Given /^the host is to become a PentaGram app host$/ do
  File.open('site.pp', 'w') do |fd|
    fd.write("""
node default {
  include pentagram-web

  group { 'puppet' : ensure => present; }
}
""")
  end
end

When /^I provision the host$/ do
  @engine = Blimpy::Engine.new
  @engine.load_file(File.open(File.join(@dir, '/Blimpfile')).read)
  @engine.fleet.start
  @vm = @engine.fleet.ships.first
  @vm.should_not be_nil
end

Then /^it should be running a web server$/ do
  running = @vm.ssh_into('pgrep apache2')
  running.should be_true
end

Then /^it should be responding to web requests$/ do
  responding = @vm.ssh_into('curl -s http://localhost -o /dev/null')
  responding.should be_true
end

