#!/system/bin/sh
#
# Bypass SafetyNet on user option
#
safetynet=`getprop ro.enable.safetynet`

case "$safetynet" in
    "1")
    setprop ro.boot.verifiedbootstate green
esac