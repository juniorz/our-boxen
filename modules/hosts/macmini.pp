class hosts::macmini {
  include homebrew
  include brewcask
  #include couchpotato

  #package { [
  #  'plex-media-server',
  #  'google-plus-auto-backup',
  #]:
  #  ensure => latest,
  #}
}
