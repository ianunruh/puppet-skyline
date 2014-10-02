class skyline::config inherits skyline {

  file { 'skyline-settings':
    ensure  => present,
    path    => "${app_path}/src/settings.py",
    content => template('skyline/settings.py.erb')
  }

}
