class skyline(
  $user = $skyline::params::user,

  ## Paths
  $app_path = $skyline::params::app_path,
  $log_path = $skyline::params::log_path,
  $pid_path = $skyline::params::pid_path,

  ## Installation source
  $git_url = 'git://github.com/etsy/skyline.git',
  $git_branch = 'master',

  ## Services
  $enable_analyzer = true,
  $enable_horizon = true,
  $enable_webapp = true,

  ## Shared settings
  $redis_socket_path = '/tmp/redis.sock',
  $full_namespace = 'metrics.',
  $mini_namespace = 'mini.',
  $full_duration = 86400,
  $mini_duration = 3600,
  $graphite_host = 'localhost',
  $graph_url = 'http://localhost/render/?width=1400&from=-1hour&target=%s',
  $carbon_port = 2003,
  $oculus_url = "http://localhost",

  # Analyzer settings
  $dump_path = 'webapp/static/dump/anomalies.json',
  $analyzer_processes = 2,
  $stale_period = 500,
  $min_tolerable_length = 1,
  $max_tolerable_boredom = 100,
  $boredom_set_size = 1,
  $canary_metric = 'changeme',
  $algorithms = [
    'first_hour_average',
    'mean_subtraction_cumulation',
    'stddev_from_average',
    'stddev_from_moving_average',
    'least_squares',
    'grubbs',
    'histogram_bins',
    'median_absolute_deviation',
    'ks_test'
  ],
  $consensus = 6,
  $enable_second_order = false,

  ## Horizon settings
  $worker_processes = 2,
  $horizon_listen_ip = '0.0.0.0',
  $pickle_listen_port = 2024,
  $udp_listen_port = 2025,
  $chunk_size = 10,
  $max_queue_size = 500,
  $roomba_processes = 1,
  $roomba_grace_time = 600,
  $max_resolution = 1000,
  $skip_metrics = [],

  ## Webapp settings
  $webapp_listen_ip = '0.0.0.0',
  $webapp_listen_port = 1500
) inherits skyline::params {

  class { 'skyline::install': } ->
  class { 'skyline::config': } ~>
  class { 'skyline::service': }

}
