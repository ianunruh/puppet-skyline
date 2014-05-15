class skyline::service inherits skyline {

  if $enable_analyzer {
    file { '/etc/init/skyline-analyzer.conf':
      ensure => present,
      content => template('skyline/skyline-analyzer.conf.erb')
    }

    service { 'skyline-analyzer':
      ensure => running,
      require => File['/etc/init/skyline-analyzer.conf']
    }
  } else {
    file { '/etc/init/skyline-analyzer.conf':
      ensure => absent
    }

    service { 'skyline-analyzer':
      ensure => stopped
    }
  }

  if $enable_horizon {
    file { '/etc/init/skyline-horizon.conf':
      ensure => present,
      content => template('skyline/skyline-horizon.conf.erb')
    }

    service { 'skyline-horizon':
      ensure => running,
      require => File['/etc/init/skyline-horizon.conf']
    }
  } else {
    file { '/etc/init/skyline-horizon.conf':
      ensure => absent
    }

    service { 'skyline-horizon':
      ensure => stopped
    }
  }

  if $enable_webapp {
    file { '/etc/init/skyline-webapp.conf':
      ensure => present,
      content => template('skyline/skyline-webapp.conf.erb')
    }

    service { 'skyline-webapp':
      ensure => running,
      require => File['/etc/init/skyline-webapp.conf']
    }
  } else {
    file { '/etc/init/skyline-webapp.conf':
      ensure => absent
    }

    service { 'skyline-webapp':
      ensure => stopped
    }
  }

}
