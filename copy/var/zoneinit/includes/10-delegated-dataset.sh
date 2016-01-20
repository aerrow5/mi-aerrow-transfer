#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/$UUID/data

if ! zfs list $DDS > /dev/null; then
        # No delegated dataset configured
        exit 0
fi

zfs set mountpoint=/data $DDS
zfs set compression=on $DDS

# enable access to all 
chmod ag+w /data



