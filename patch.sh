#!/bin/sh

adb wait-for-device
adb -e push ramdisk.img /data/local/tmp/ramdisk.img.gz
[[ -f magisk.zip ]] && adb -e push magisk.zip /data/local/tmp/magisk.zip
[[ -f magisk.apk ]] && adb -e push magisk.apk /data/local/tmp/magisk.zip
adb -e push busybox_arm64 /data/local/tmp/
adb -e push process.sh /data/local/tmp/
adb -e shell "dos2unix /data/local/tmp/process.sh"
adb -e shell "sh /data/local/tmp/process.sh /data/local/tmp $1"
adb -e pull /data/local/tmp/ramdisk.img
