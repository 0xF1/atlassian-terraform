#!/bin/bash

Counter=0
MaxCounter=180

AvailabilityZone="$(wget http://169.254.169.254/latest/meta-data/placement/availability-zone -q -O -)"
Port=2049
Mountpoint=/atlassian

Hostname="$AvailabilityZone.fs-4fb74a86.efs.eu-west-1.amazonaws.com"

mkdir -m 755 -p $Mountpoint

echo "$Hostname:/ $Mountpoint nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0" >> /etc/fstab

while [ $Counter -le $MaxCounter ]
do
    if $(mount -a) ; then
        break
    fi

    Counter=$((Counter+1))

done

