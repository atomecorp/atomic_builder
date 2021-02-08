# Disk Layout

```
MBR
|-> s1 FAT Partition
`-> s2 BSD
    `-> a UFS Partition
```
qemu_user_static_enable="YES"

sudo /usr/local/etc/rc.d/qemu_user_static start

sudo ./eVe_builder amd64 
or for an arm image
sudo ./eVe_builder arm

then copy to USB using : 

sudo dd if=atome-arm.img  of=/dev/da0 bs="1M"
