default['rsnapshot']['server']['config_file'] = "/etc/rsnapshot.conf"

default['rsnapshot']['server']['snapshot_root'] = "/backup"
default['rsnapshot']['server']['keyname'] = 'rsnapshot_dsa'
# Allow system to set default root_home
default['rsnapshot']['server']['keydir'] = ''
# The contents of the public key shipped to the clients
# This is overwritten on each invocation of the server recipe!
default['rsnapshot']['server']['ssh_key'] = nil

default['rsnapshot']['server']['intervals']['hourly'] = 2
default['rsnapshot']['server']['intervals']['daily'] = 7
default['rsnapshot']['server']['intervals']['weekly'] = 2
default['rsnapshot']['server']['intervals']['monthly'] = nil

# additional clients which can not be inferred from the client role
default['rsnapshot']['server']['clients'] = {}
