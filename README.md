# Ansible Role for ZFS

Install and configure ZFS kernel modules and pools with Ansible.

## Skip ZFS on some hosts

The role installs ZFS on every host it runs on. To skip a host, set
`zfs_enabled: false` in the inventory, for example in the `group_vars` of a
host group that has no ZFS pools:

```yaml
zfs_enabled: false
```

The role then does nothing on that host: no zfs-release repository, no
`kernel-devel`, no DKMS, no kernel module, no tuning service and no pools. It
does not remove ZFS from a host that already has it.

The [Contributing Guide](CONTRIBUTING.md) explains how to work with and
contribute to this repository.
