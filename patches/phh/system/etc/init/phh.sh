#!/system/bin/sh
# phh.on-boot — base init script for semigsi ports
# Applied from phhusson patches.

# Enable logcat access
setprop ctl.start logd 2>/dev/null

# Mount /system read-write if supported (used by rw-system.sh)
if [ -c /dev/block/platform/... ] 2>/dev/null; then
    mount -o rw,remount /system 2>/dev/null
fi

# Apply phh-specific property overrides
setprop persist.sys.phh.treble 1
setprop persist.sys.phh.encrypted 1

# Disable verity-related boot complaints
setprop ro.crypto.state unencrypted 2>/dev/null

exit 0
