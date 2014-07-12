# Private: Includes a user's personal manifest based on their github username

class boxen_ext::hosts {
  include boxen::config

  $manifests = "${boxen::config::repodir}/modules/people/manifests"
  $_hostname = regsubst($hostname, '-','_', 'G')

  if $_hostname != $hostname {
    notice("Changed boxen::hosts hostname to ${_hostname}")
  }
  if file_exists("${manifests}/${_hostname}.pp") {
    include "hosts::${_hostname}"
  }
}