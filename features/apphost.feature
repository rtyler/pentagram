Feature: Serve the PentaGram web application
  In order to serve up PentaGram (and satanic phots)
  to millions of devil worshippers

  As an operations engineer

  App hosts should be configured to run the PentaGram
  web application


  Scenario: Provision a fresh app host
    Given an empty host
    And the host is to become a PentaGram app host
    When I provision the host
    Then it should be running a web server
    And it should be responding to web requests
