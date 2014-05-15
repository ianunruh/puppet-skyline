# Skyline

Puppet module for installing and configuring Skyline, the anomaly detection component of the Etsy Kale stack.

Tested on Ubuntu Server 14.04 only.

## Usage

```pp
class { 'skyline':
  canary_metric => 'carbon.agents.monitor-a.metricsReceived'
}
```

If Carbon/Graphite/Oculus are on another host, then you need to do a bit more.

```
class { 'skyline':
  canary_metric => 'carbon.agents.monitor-a.metricsReceived',
  graphite_host => '10.0.0.2',
  graph_url => 'http://10.0.0.2/render/?width=1400&from=-1hour&target=%s',
  oculus_url => 'http://10.0.0.3'
}
```
