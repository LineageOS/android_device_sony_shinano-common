#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


function blob_fixup() {
    case "${1}" in
        lib/hw/camera.vendor.qcom.so)
            sed -i "s|com.sonyericsson.permission.CAMERA_EXTENDED|android.permission.CAMERA\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0|g" "${2}"
            ;;
        lib/libcameralight.so)
            sed -i "s|/system/etc/flashled_calc_parameters.cfg|/vendor/etc/flashled_calc_parameters.cfg|g" "${2}"
            ;;
        vendor/bin/netmgrd)
            sed -i "s|/system/etc/data/netmgr_config.xml|/vendor/etc/data/netmgr_config.xml|g" "${2}"
            ;;
        vendor/bin/qmuxd)
            sed -i "s|/system/etc/data/qmi_config.xml|/vendor/etc/data/qmi_config.xml|g" "${2}"
            ;;
        vendor/lib/hw/audio.primary.msm8974.so)
            sed -i "s|/system/etc/mixer_paths.xml|/vendor/etc/mixer_paths.xml|g" "${2}"
            sed -i "s|/system/etc/sony_effect/|/vendor/etc/sony_effect/|g" "${2}"
            sed -i "s|/system/etc/tfa98xx/|/vendor/etc/tfa98xx/|g" "${2}"
            sed -i "s|/system/lib/soundfx/|/vendor/lib/soundfx/|g" "${2}"
            ;;
        vendor/lib/libaudioroute.so)
            sed -i "s|/system/etc/mixer_paths.xml|/vendor/etc/mixer_paths.xml|g" "${2}"
            ;;
        vendor/lib/libdsi_netctrl.so)
            sed -i "s|/system/etc/data/dsi_config.xml|/vendor/etc/data/dsi_config.xml|g" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE_PLATFORM=msm8974-common

"./../../${VENDOR}/${DEVICE_PLATFORM}/extract-files.sh" "$@"
