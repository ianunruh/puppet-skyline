class skyline(
  $user = $skyline::params::user,

  ## Paths
  $app_path = $skyline::params::app_path,
  $log_path = $skyline::params::log_path,
  $pid_path = $skyline::params::pid_path,

  ## Installation source
  $git_url = $skyline::params::git_url,
  $git_branch = $skyline::params::git_branch,

  ## Services
  $enable_analyzer = $skyline::params::enable_analyzer,
  $enable_horizon = $skyline::params::enable_horizon,
  $enable_webapp = $skyline::params::enable_webapp,

  ## Shared settings
  $redis_socket_path = $skyline::params::redis_socket_path,
  $full_namespace = $skyline::params::full_namespace,
  $mini_namespace = $skyline::params::mini_namespace,
  $full_duration = $skyline::params::full_duration,
  $mini_duration = $skyline::params::mini_duration,
  $graphite_host = $skyline::params::graphite_host,
  $graph_url = $skyline::params::graph_url,
  $carbon_port = $skyline::params::carbon_port,
  $oculus_url = $skyline::params::oculus_url,

  # Analyzer settings
  $dump_path = $skyline::params::dump_path,
  $analyzer_processes = $skyline::params::analyzer_processes,
  $stale_period = $skyline::params::stale_period,
  $min_tolerable_length = $skyline::params::min_tolerable_length,
  $max_tolerable_boredom = $skyline::params::max_tolerable_boredom,
  $boredom_set_size = $skyline::params::boredom_set_size,
  $canary_metric = $skyline::params::canary_metric,
  $algorithms = $skyline::params::algorithms,
  $consensus = $skyline::params::consensus,
  $enable_second_order = $skyline::params::enable_second_order,

  ## Horizon settings
  $worker_processes = $skyline::params::worker_processes,
  $horizon_listen_ip = $skyline::params::horizon_listen_ip,
  $pickle_listen_port = $skyline::params::pickle_listen_port,
  $udp_listen_port = $skyline::params::udp_listen_port,
  $chunk_size = $skyline::params::chunk_size,
  $max_queue_size = $skyline::params::max_queue_size,
  $roomba_processes = $skyline::params::roomba_processes,
  $roomba_grace_time = $skyline::params::roomba_grace_time,
  $max_resolution = $skyline::params::max_resolution,
  $skip_metrics = $skyline::params::skip_metrics,

  ## Webapp settings
  $webapp_listen_ip = $skyline::params::webapp_listen_ip,
  $webapp_listen_port = $skyline::params::webapp_listen_port,
) inherits skyline::params {

  validate_string($canary_metric)

  anchor { 'skyline::begin': } ->
  class { 'skyline::install': } ->
  class { 'skyline::config': } ~>
  class { 'skyline::service': } ->
  anchor { 'skyline::end': }

}
