class projects::gap {
  include gid::environment

  file {
    '/tw' :
      ensure => directory;

    '/tw/Gap' :
      ensure => directory;
  }

}
