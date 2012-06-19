class pentagram-web {
  class {
    'apache' : ;
    'ruby' : ;
    'passenger' : ;
  }

  # XXX: HAXZ? It seems that the proper dependency isn't
  # set up between the puppetlabs-passenger module and the
  # puppetlabs-apache module which results in Apache trying
  # to start before Passenger has..compiled itself? (huge wtf)
  # I don't know how to RSpec this, so I'm hoping a couple
  # iterations of Cucumbr will figure it out properly
  Exec['compile-passenger'] -> Service['httpd']

  package {
    'build-essential' :
      ensure => present;
    'libz-dev' :
      ensure => present;
  }
}
