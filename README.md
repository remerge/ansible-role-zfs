# Ansible Role for ZFS

Install and configure ZFS kernel modules and pools with Ansible.

The [Contributing Guide](CONTRIBUTING.md) explains how to work with and
contribute to this repository.

## Checks Around a Reboot

Two task files guard a reboot. Include them from the playbook that reboots:

```yaml
- name: Verify ZFS before the reboot
  ansible.builtin.include_role:
    name: remerge.zfs
    tasks_from: pre-reboot

- name: Reboot
  ansible.builtin.reboot:

- name: Verify ZFS after the reboot
  ansible.builtin.include_role:
    name: remerge.zfs
    tasks_from: post-reboot
```

- `pre-reboot` finds the kernel the host boots next (`grubby --default-kernel`),
  builds the ZFS module for it with DKMS if it is missing or older than the
  installed `zfs` package, and fails the host if that still leaves no matching
  module. It also fails if a pool is not ONLINE, and records the imported pools.
- `post-reboot` fails the host if the loaded module does not match the `zfs`
  package, if a pool from before the reboot is not imported, or if a pool is
  not ONLINE.

Both pass on hosts without the `zfs` package.
