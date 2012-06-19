class pentagram-web {
  class {
    'apache' : ;
    'ruby' : ;
    'passenger' : ;
  }

  package {
    'build-essential' :
      ensure => present;
    'zlib-devel' :
      ensure => present;
  }
}
