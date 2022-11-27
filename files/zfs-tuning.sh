#!/bin/bash
echo 12 >/sys/module/zfs/parameters/l2arc_headroom
echo 1000000000 >/sys/module/zfs/parameters/l2arc_write_max #6442450944 for nvme
echo 0 >/sys/module/zfs/parameters/l2arc_noprefetch
# commented until tunung for spinning disks
#echo 100 > /sys/module/zfs/parameters/zfs_vdev_async_read_max_active
#echo 100 > /sys/module/zfs/parameters/zfs_vdev_async_write_max_active
#echo 100 > /sys/module/zfs/parameters/zfs_vdev_sync_read_max_active
#echo 100 > /sys/module/zfs/parameters/zfs_vdev_sync_write_max_active
#echo 6000 > /sys/module/zfs/parameters/zfs_vdev_max_active
