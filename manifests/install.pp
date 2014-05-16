class skyline::install inherits skyline {
  Exec {
    path => ['/usr/local/bin', '/usr/bin']
  }

  user { $user:
    ensure => present,
    home => $app_path
  }

  ensure_resource('package', 'git', { 'ensure' => 'installed' })
  ensure_resource('package', 'python-pip', { 'ensure' => 'installed' })
  ensure_resource('package', 'python-msgpack', { 'ensure' => 'installed' })
  ensure_resource('package', 'python-numpy', { 'ensure' => 'installed' })
  ensure_resource('package', 'python-pandas', { 'ensure' => 'installed' })
  ensure_resource('package', 'python-scipy', { 'ensure' => 'installed' })

  exec { 'clone-skyline':
    command => "git clone -b ${git_branch} ${git_url} ${app_path}",
    creates => $app_path,
    require => Package['git'],
    notify => Exec['skyline-pip-install']
  }

  file { 'skyline-webapp-dump':
    ensure => directory,
    path => "${app_path}/src/webapp/static/dump",
    owner => $user,
    require => Exec['clone-skyline']
  }

  exec { 'skyline-pip-install':
    command => 'pip install -r requirements.txt',
    cwd => $app_path,
    refreshonly => true
  }

  file { $log_path:
    ensure => directory,
    owner => $user
  }

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

}
