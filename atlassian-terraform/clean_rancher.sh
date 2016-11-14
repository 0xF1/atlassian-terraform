rm -rf /var/lib/rancher/bin/rancher-ha-start.sh /var/lib/rancher/etc/server/encryption.key /var/lib/rancher/etc/server.conf ; docker rm -f $(docker ps -qa)

