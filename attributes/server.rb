default['rsnapshot']['server']['config_file'] = "/etc/rsnapshot.conf"

default['rsnapshot']['server']['snapshot_root'] = "/backup"
# Do not use root user .ssh or id_dsa
default['rsnapshot']['server']['keydir'] = '/etc/rsnapshot/.ssh'
default['rsnapshot']['server']['keyname'] = 'rsnapshot_dsa'
# The contents of the public key shipped to the clients
# This is overwritten on each invocation of the server recipe!
default['rsnapshot']['server']['ssh_key'] = ''

default['rsnapshot']['server']['intervals']['hourly'] = 2
default['rsnapshot']['server']['intervals']['daily'] = 7
default['rsnapshot']['server']['intervals']['weekly'] = 2
default['rsnapshot']['server']['intervals']['monthly'] = nil

# additional clients which can not be inferred from the client role
default['rsnapshot']['server']['clients'] = {}
