class people::juniorz::osx_config {
  include osx::global::disable_key_press_and_hold
  include osx::global::enable_standard_function_keys
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click

  include osx::dock::autohide
  include osx::dock::dim_hidden_apps

  include osx::no_network_dsstores

  include osx::global::key_repeat_rate

  class { 'osx::dock::hot_corners':
    top_right => 'Put Display to Sleep',
  }

  class { 'boxen::security' :
    screensaver_delay_sec => '3',
  }

  # Shell
  osx_chsh { $::luser:
    shell   => '/opt/boxen/homebrew/bin/zsh',
    require => Package['zsh'],
  }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh'],
  }

  # Stop Preview re-opening documents
  boxen::osx_defaults { 'Stop Preview re-opening documents':
    ensure => present,
    domain => 'com.apple.Preview',
    key    => 'NSQuitAlwaysKeepsWindows',
    value  => 'NO',
  }
}
