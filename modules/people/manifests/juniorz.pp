# My username config

class people::juniorz {
  include people::juniorz::osx_config
  include people::juniorz::apps

  $my_home_dir = "/Users/${::boxen_user}"
  $my_apps_dir = "${my_home_dir}/Applications"

  osx_login_item { 'Alfred 2':
    name    => 'Alfred 2',
    path    => "${my_apps_dir}/Alfred 2.app",
    hidden  => true,
    require => Package['alfred'],
  }

  osx_login_item { 'Caffeine':
    name    => 'Caffeine',
    path    => "${my_apps_dir}/Caffeine.app",
    hidden  => true,
    require => Package['caffeine'],
  }

  osx_login_item { 'Flux':
    name    => 'Flux',
    path    => "${my_apps_dir}/Flux.app",
    hidden  => true,
    require => Package['flux'],
  }

  osx_login_item { 'Dropbox':
    name    => 'Dropbox',
    path    => "${my_apps_dir}/Dropbox.app",
    hidden  => true,
    require => Package['dropbox'],
  }

  osx_login_item { 'Steam':
    ensure  => absent,
    name    => 'Steam',
    path    => "${my_apps_dir}/Steam.app",
    hidden  => true,
    require => Package['steam'],
  }

  boxen::osx_defaults { 'Copy text from QuickLook':
    ensure => present,
    domain => 'com.apple.finder',
    key    => 'QLEnableTextSelection',
    value  => 'YES',
  }

  boxen::osx_defaults { 'Finder Status Bar':
    ensure  => present,
    domain  => 'com.apple.finder',
    key     => 'ShowStatusBar',
    value   => 'YES',
  }

  boxen::osx_defaults { 'Show time connected in the VPN menubar item':
    domain => 'com.apple.networkConnect',
    key    => 'VPNShowTime',
    type   => 'bool',
    value  => 'true',
  }

  #
  #		# Set up iTerm Preferences
  #		boxen::osx_defaults { 'Load iTerm prefences from a custom folder':
  #			domain => 'com.googlecode.iterm2',
  #			key    => 'LoadPrefsFromCustomFolder',
  #			type   => 'bool',
  #			value  => 'true',
  #		}
  #
  #		boxen::osx_defaults { 'Load iTerm prefences from Dropbox':
  #			domain => 'com.googlecode.iterm2',
  #			key    => 'PrefsCustomFolder',
  #			value  => '~/Dropbox/Apps/iTerm',
  #		}
  #
  #		boxen::osx_defaults {'Always sync local iTerm preferences to Dropbox':
  #			domain => 'com.googlecode.iterm2',
  #			key		=> 'NoSyncNeverRemindPrefsChangesCopy',
  #			type	 => 'bool',
  #			value  => 'true',
  #		}


  # ALfred preferences
  # defaults write com.runningwithcrayons.Alfred-Preferences "hotkey.default" -dict "key" 49 "mod" 1048576 "string" "Space"
  # defaults write com.runningwithcrayons.Alfred-Preferences "hotkey.default" -dict-add "key" 49
  # defaults write com.runningwithcrayons.Alfred-Preferences "hotkey.default" -dict-add "mod" 1048576
  # defaults write com.runningwithcrayons.Alfred-Preferences "hotkey.default" -dict-add "string" "Space"

  # defaults write com.lightheadsw.Caffeine "SuppressLaunchMessage" 1

  # defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder


  #  include vim
  #
  #  $home     = "/Users/${::boxen_user}"
  #  $my       = "${home}/my"
  #  $dotfiles = "${my}/dotfiles"
  #
  #  file { $my:
  #    ensure  => directory
  #  }
  #
  #  repository { $dotfiles:
  #    source  => 'jbarnette/dotfiles',
  #    require => File[$my]
  #  }
}
