### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# begin properties
properties() { '
kernel.string=kernel.string=A/B Ramdisk lz4 remover for lahaina + TWRP installer by SyberHexen @ xda-developers
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=berlna
device.name2=berlin
device.name3=dubai
device.name4=xpeng
device.name5=tundra
supported.versions=
supported.patchlevels=
'; } # end properties

### AnyKernel install
# begin attributes
attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
} # end attributes


## active boot shell variables
block=boot
is_slot_device=1;
slot_select=active
ramdisk_compression=gz;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh && attributes;

# boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk

write_boot; # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
## end boot install

## inactive boot shell variables
block=boot
is_slot_device=1;
slot_select=inactive
ramdisk_compression=gz;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh && attributes;

# boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk

write_boot; # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
## end boot install

## active vendor_boot shell variables
block=vendor_boot;
is_slot_device=1;
slot_select=active
ramdisk_compression=gz;
patch_vbmeta_flag=auto;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot

write_boot; # use flash_boot to skip ramdisk repack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot
## end vendor_boot install

## inactive vendor_boot shell variables
block=vendor_boot;
is_slot_device=1;
slot_select=inactive
ramdisk_compression=gz;
patch_vbmeta_flag=auto;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot

write_boot; # use flash_boot to skip ramdisk repack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot
## end vendor_boot install
