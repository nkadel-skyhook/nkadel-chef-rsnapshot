rsnapshot cookbook
==================

Installs and configures rsnapshot server and clients

Requirements
------------
### Platform
* Ubuntu
* Red Hat Enterprise Linux (CentOS/Amazon/Scientific/Oracle) 5.X, 6.X

### Cookbooks
* cron
* openssh
* rsync
* sudo
* yum-epel (under review for RHEL systems)

* `node['authorization']['sudo']['include_sudoers_d']` *must* be `true` for clients.

Attributes
----------
* default['rsnapshot']['server_role'] = "rsnapshot_server"
* default['rsnapshot']['client_role'] = "rsnapshot_client"

* default['rsnapshot']['client']['username'] = "rsnapshot"
* default['rsnapshot']['client']['paths'] = []

* default['rsnapshot']['server']['config_file'] = "/etc/rsnapshot.conf"

* default['rsnapshot']['server']['snapshot_root'] = "/backup"
* # Do not use root user .ssh or id_dsa
* default['rsnapshot']['server']['keydir'] = '/etc/rsnapshot/.ssh'
* default['rsnapshot']['server']['keyname'] = 'rsnapshot_dsa'
* # The contents of the public key shipped to the clients
* # This is overwritten on each invocation of the server recipe!
* default['rsnapshot']['server']['ssh_key'] = ''

* default['rsnapshot']['server']['intervals']['hourly'] = 2
* default['rsnapshot']['server']['intervals']['daily'] = 7
* default['rsnapshot']['server']['intervals']['weekly'] = 2
* default['rsnapshot']['server']['intervals']['monthly'] = nil
 
* # additional clients which can not be inferred from the client role
* default['rsnapshot']['server']['clients'] = {}

License & Authors
-----------------
- Author:: Joshua Sierles <joshua@rasgueado.local>
- Author:: Holger Just <hjust@meine-er.de>
- Author:: Ian Blenke <ian@blenke.com>
- Author:: Nico Kadel-Garcia <nkadel@skyhookwireless.com>

```text
Copyright 2009, Joshua Sierles
Copyright 2010-2012, Holger Just
Copyright 2013-2014, Ian Blenke
Copyright 2014-2015, Nico Kadel-Garcia

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
