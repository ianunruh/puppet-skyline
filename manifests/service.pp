class skyline::service inherits skyline {

  file { '/etc/init/skyline-analyzer.conf':
    ensure => present,
    content => template('skyline/skyline-analyzer.conf.erb')
  }

  file { '/etc/init/skyline-horizon.conf':
    ensure => present,
    content => template('skyline/skyline-horizon.conf.erb')
  }

  file { '/etc/init/skyline-webapp.conf':
    ensure => present,
    content => template('skyline/skyline-webapp.conf.erb')
  }

  if $enable_analyzer {
    service { 'skyline-analyzer':
      ensure => running,
      enable => true,
      require => File['/etc/init/skyline-analyzer.conf']
    }
  } else {
    service { 'skyline-analyzer':
      ensure => stopped,
      enable => false,
      require => File['/etc/init/skyline-analyzer.conf']
    }
  }

  if $enable_horizon {
    service { 'skyline-horizon':
      ensure => running,
      enable => true,
      require => File['/etc/init/skyline-horizon.conf']
    }
  } else {
    service { 'skyline-horizon':
      ensure => stopped,
      enable => false,
      require => File['/etc/init/skyline-horizon.conf']
    }
  }

  if $enable_webapp {
    service { 'skyline-webapp':
      ensure => running,
      enable => true,
      require => File['/etc/init/skyline-webapp.conf']
    }
  } else {
    service { 'skyline-webapp':
      ensure => stopped,
      enable => false,
      require => File['/etc/init/skyline-webapp.conf']
    }
  }

}
