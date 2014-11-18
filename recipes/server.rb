include_recipe "cron"

package "rsnapshot"
require 'shellwords'

# create the private key if necessary
root_home = Etc.getpwnam("root").dir
directory "#{root_home}/.ssh" do
  owner "root"
  group "root"
  mode "0700"
end

execute "create ssh keypair for root" do
  cwd root_home
  user "root"
  command <<-KEYGEN.gsub(/^ +/, '')
    ssh-keygen -t dsa -b 2048 -f #{root_home}/.ssh/id_dsa -N '' \
    -C 'root@#{node['fqdn']}-#{Time.now.strftime('%FT%T%z')}'
    chmod 0600 #{root_home}/.ssh/id_dsa
    chmod 0644 #{root_home}/.ssh/id_dsa.pub
  KEYGEN
  creates "#{root_home}/.ssh/id_dsa"
end

ruby_block "set public key to node" do
  block do
    unless Chef::Config[:solo]
      node['rsnapshot']['server']['ssh_key'] = File.read("#{root_home}/.ssh/id_dsa.pub").strip
    end
  end
end

directory node['rsnapshot']['server']['snapshot_root'] do
  owner "root"
  group "root"
  mode "0700"
end

backup_targets = []
node['rsnapshot']['server']['clients'].each_pair do |fqdn, paths|
  Array(paths).each do |path|
    path = path.end_with?("/") ? Shellwords.escape(path) : "#{Shellwords.escape(path)}/"
    backup_targets << "#{node['rsnapshot']['client']['username']}@#{fqdn}:#{path}\t#{fqdn}/"
  end
end

search(:node, "roles:#{node['rsnapshot']['client_role']}") do |client|
  paths = client['rsnapshot']['client']['paths']
  next unless paths && paths.any?

  paths.each do |path|
    path = path.end_with?("/") ? Shellwords.escape(path) : "#{Shellwords.escape(path)}/"
    if client.name == node.name
      backup_targets << "#{path}\t#{client['fqdn']}/"
    else
      # FIXME: What about ipv6?
      backup_targets << "#{client['rsnapshot']['client']['username']}@#{client['ipaddress']}:#{path}\t#{client['fqdn']}/"
    end
  end
end

template node['rsnapshot']['server']['config_file'] do
  source "rsnapshot.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables "backup_targets" => backup_targets,
            "ssh_key_location" => "#{root_home}/.ssh/id_dsa"
end

template "/etc/cron.d/rsnapshot" do
  source "cron.erb"
  owner "root"
  group "root"
  mode "0644"
end
