packages:
  pkg.latest:
    - names:
      - lvm2

create pv:
  lvm.pv_present:
    - name: /dev/xvde1

create vg:
  lvm.vg_present:
    - name: vglocal00
    - devices: /dev/xvde1

create lv:
  lvm.lv_present:
    - name: pgsql00
    - extents: 100%Free
    - vgname: vglocal00

format lv:
  blockdev.formatted:
    - name: /dev/vglocal00/pgsql00
    - fs_type: ext4

  mount.mounted:
    - name: /mnt/data
    - device: /dev/vglocal00/pgsql00
    - fstype: ext4
    - mkmnt: True
