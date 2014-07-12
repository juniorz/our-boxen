class people::juniorz::apps {
  include homebrew
  include brewcask
  include couchpotato

  package { ['git', 'vim', 'zsh']:
    ensure => present,
  }

  package { [
    'adium',
    'alfred',
    'arduino',
    'caffeine',
    'cyberduck',
    'dropbox',
    'evernote',
    'flux',
    'google-hangouts',
    'iterm2',
    'jubler',
    'limechat',
    'onepassword',
    'skitch',
    'spectacle',
    'steam',
    'the-unarchiver',
    'vagrant',
    'virtualbox',
  ]:
    provider => 'brewcask',
    ensure => present,
    install_options => [
      '--verbose'
    ]
  }

  package { [
    'betterzipql',
    'provisionql',
    'qlcolorcode',
    'qlmarkdown',
    'qlprettypatch',
    'qlstephen',
    'quicklook-csv',
    'quicklook-json',
    'suspicious-package',
    'webp-quicklook',
  ]:
    provider => 'brewcask',
    ensure => present
  }


  ## specific to TW image
  #file { '/Applications/Adium.app':
  #  ensure => absent,
  #  force => true
  #}

  # Modify Alfred's scope to include the Homebrew Cask apps
  exec { 'add_cask_to_alfred':
    command => "brew cask alfred link",
    onlyif => "brew cask alfred status | grep -q 'Alfred is not linked'",
    refreshonly => true,
  }

  Package <| provider == brewcask |> ~> Exec['add_cask_to_alfred']
}
