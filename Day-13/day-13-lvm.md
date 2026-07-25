# Day 13 – Linux Logical Volume Manager (LVM)

## Objective

Learn how to create, manage, mount, and extend logical storage using Linux LVM.

---

## Commands Used

```bash
lsblk
pvs
vgs
lvs
df -h
pvcreate
vgcreate
lvcreate
mkfs.ext4
mount
lvextend
resize2fs
```

---

## Steps Performed

1. Checked existing storage.
2. Created a Physical Volume.
3. Created a Volume Group.
4. Created a Logical Volume.
5. Formatted it using ext4.
6. Mounted it.
7. Verified disk usage.
8. Extended the logical volume.
9. Resized the filesystem.

---

## What I Learned

- LVM allows storage to be resized without repartitioning disks.
- Logical Volumes are easier to manage than traditional partitions.
- Filesystems must be resized after extending a logical volume.

---

## Real-world Use Case

LVM is widely used in production servers because storage can be increased without reinstalling the operating system or recreating partitions. This makes storage management flexible and reduces downtime..
