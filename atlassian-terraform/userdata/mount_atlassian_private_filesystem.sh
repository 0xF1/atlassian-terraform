#!/bin/bash

Counter=0
MaxCounter=180

AvailabilityZone="$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)"
Port=2049
Mountpoint=/var/lib/atlassian_efs_mountpoint

# Hack - we only want the last char of $Acailability in order
# to use in the previously seeded dns entry
AvailabilityZone="${AvailabilityZone:$((${#AvailabilityZone}-1)):1}"

Hostname="filesystem_private_zone_$AvailabilityZone.fastervl.com"

while [ $Counter -le $MaxCounter ]
do
    if $(nc -w 10 $Hostname $Port >/dev/null 2>&1) ; then
        mkdir -m 755 -p $Mountpoint
        echo "$Hostname:/ $Mountpoint nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0" >> /etc/fstab
        mount -a
        touch $Mountpoint/$Hostname.txt
        break
    fi

    Counter=$((Counter+1))

done

