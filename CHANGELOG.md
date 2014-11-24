## 0.1.2
* [**Nico Kadel-Garcia**](https://github.com/nkadel-skyhook):
  Added '--sender' test to validate-command.sh, ensure only rsync read accesss.
  Use 'keydir' more consistently in rsnapshot::server.
  Use 'node.set' for Chef 11 compatibility in rsnapshot::Server.
  Stop trying to set DSA key length.  

## 0.1.1

* [**Nico Kadel-Garcia**](https://github.com/nkadel-skyhook):
  Change default key location to /etc/rsnapshot/keys/rsnapshot_dsa.
  Fix mistaken '[' in recipes/server.rb.
  Replace white space in description clauses for Berkshelf compatibility.

## 0.1.0

* [**Nico Kadel-Garcia**](https://github.com/nkadel-skyhook):
  Set SSH directory to be selectable variable.
  Set keyfile to be 'rsnapshot_dsa' by default, but with selectable attribute.
  Set key to be DSA, not RSA.
  Add 'sudo' dependency
  Add .gitignore file.

## 0.0.1
* Ian Blenke's rewrite of https://github.com/cookbooks/rsnapshot

