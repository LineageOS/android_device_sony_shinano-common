# Copyright (C) 2013-2016 The CyanogenMod Project
#           (C) 2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from msm8974-common
include device/sony/msm8974-common/BoardConfigCommon.mk

COMMON_PATH := device/sony/shinano-common

# Platform
BOARD_VENDOR_PLATFORM := shinano
PRODUCT_PLATFORM := shinano

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x37 ehci-hcd.park=3 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y vmalloc=300M

# Audio
AUDIO_FEATURE_DISABLED_FM_VIRTUAL_RECORD := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_AUXPCM_BT := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE = true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/bluetooth/vnd_shinano.txt

# BT/FM (Broadcom): Adjust the sysfs patch for 3.4 kernel
BOARD_HAVE_BCM_FM_SYSFS := "/sys/bus/platform/drivers/bcm_ldisc/bcm_ldisc/"
BOARD_BRCM_HCI_NUM := 26

# Camera
TARGET_USES_MEDIA_EXTENSIONS := true

# Filesystem
TARGET_FS_CONFIG_GEN += $(COMMON_PATH)/config.fs

# FM
BOARD_HAVE_BCM_FM := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_shinano

# Partition information
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2671771648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12656294912
BOARD_ROOT_EXTRA_FOLDERS := lta-label

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(COMMON_PATH)/sepolicy

# Sensors
USE_SENSOR_MULTI_HAL := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/lib/libsomc_chokoballpal.so|/vendor/lib/libshim_camera.so

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA := "/vendor/firmware/fw_bcmdhd.bin"
