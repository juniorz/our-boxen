class couchpotato {
  include homebrew
  include homebrew::config

  package { 'couchpotatoserver' :
    ensure          => present,
  }

  # preferred symlink syntax
  $couchpotato_service = "homebrew.mxcl.couchpotatoserver"
  $couchpotato_plist = "${couchpotato_service}.plist"

  file { "/Library/LaunchDaemons/${couchpotato_plist}":
    content => template("couchpotato/${couchpotato_plist}.erb"),
    group   => 'wheel',
    owner   => 'root' ,
    require => Package['couchpotatoserver'],
  }
  ~>
  service { "${couchpotato_service}" :
    #ensure => running,
    ensure => stopped,
    enable => false,
    alias => 'couchpotato'
  }
}
