cp boot/* /media/boot/
cp -r lib/ /
cd /boot
update-initramfs -c -k ${kver}
mkimage -A arm -O linux -T ramdisk -a 0x0 -e 0x0 -n initrd.img-${kver} -d initrd.img-${kver} uInitrd-${kver}
cp uInitrd-${kver} /media/boot/uInitrd
sync
