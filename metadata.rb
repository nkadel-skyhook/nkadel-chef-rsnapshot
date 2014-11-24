name             "rsnapshot"
maintainer       "Finn GmbH"
maintainer_email "info@finn.de"
license          "MIT"
description      "rsnapshot"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

%w{ ubuntu debian centos fedora scientific amazon }.each do |os|
  supports os
end

depends "cron"
depends "openssh"
depends "rsync"
depends "sudo"
