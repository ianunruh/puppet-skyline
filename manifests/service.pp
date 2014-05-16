class skyline::service inherits skyline {

  if $enable_analyzer {
    service { 'skyline-analyzer':
      ensure => running,
      enable => true
    }
  } else {
    service { 'skyline-analyzer':
      ensure => stopped,
      enable => false
    }
  }

  if $enable_horizon {
    service { 'skyline-horizon':
      ensure => running,
      enable => true
    }
  } else {
    service { 'skyline-horizon':
      ensure => stopped,
      enable => false
    }
  }

  if $enable_webapp {
    service { 'skyline-webapp':
      ensure => running,
      enable => true
    }
  } else {
    service { 'skyline-webapp':
      ensure => stopped,
      enable => false
    }
  }

}
