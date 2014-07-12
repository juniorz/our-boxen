class gid::environment {
  include homebrew
  include brewcask

  #homebrew::tap { 'homebrew/versions': }

  # gradle 1.12
  homebrew::formula { 'gradle': }

  package {
    ['subversion17', 'sonar-runner', 'boxen/brews/gradle'] :
      ensure => present;

    'subversion' :
      ensure => absent,
      before => Package['subversion17'];
  }

  # what about eclipse-java ? and plugins
  package { 'intellij-idea' :
    provider => brewcask,
    ensure => present,
  }

  file { 'intellij code style' :
    path => '/Users/king/Library/Preferences/IntelliJIdea13/codestyles/GID.xml',
    content => template('gid/GID.xml')
  }

 }
