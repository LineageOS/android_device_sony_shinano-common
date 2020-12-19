#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE_PLATFORM="msm8974-common"
export DEVICE_PLATFORM_BARRIER="castor castor_windy sirius z3 z3c z3dual"

"./../../${VENDOR}/${DEVICE_PLATFORM}/setup-makefiles.sh" "$@"
