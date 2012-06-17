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
  pending # express the regexp above with the code you wish you had
end

When /^I provision the host$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^it should be running a web server$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^it should be responding to web requests$/ do
  pending # express the regexp above with the code you wish you had
end

