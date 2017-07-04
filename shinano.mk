# Copyright (C) 2013 The CyanogenMod Project
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
$(call inherit-product, device/sony/msm8974-common/msm8974.mk)

COMMON_PATH := device/sony/shinano-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Init
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(COMMON_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(COMMON_PATH)/rootdir/init.camera.rc:root/init.camera.rc \
    $(COMMON_PATH)/rootdir/init.platform-common.rc:root/init.platform-common.rc \
    $(COMMON_PATH)/rootdir/init.sony.rc:root/init.sony.rc \
    $(COMMON_PATH)/rootdir/init.qcom.power.rc:root/init.qcom.power.rc \
    $(COMMON_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc \
    $(COMMON_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

# Recovery Init
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.qcom.power.rc:root/init.recovery.qcom.rc

# Camera (stock .575 blobs)
PRODUCT_PACKAGES += \
	libshims_wvm \
	libshims_signal \
	libshims_idd \
        libsonycamera

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/sbin/tad_static:root/sbin/tad_static

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/bin/credmgrfirstboot.sh:system/bin/credmgrfirstboot.sh

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(COMMON_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(COMMON_PATH)/configs/audio/mixer_paths_auxpcm.xml:system/etc/mixer_paths_auxpcm.xml

PRODUCT_PACKAGES += \
    tfa9890_amp

# Assertive Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ad_calib.cfg:system/etc/ad_calib.cfg

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/configs/qmi_config.xml:system/etc/data/qmi_config.xml

# Media profile
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# FM
PRODUCT_PACKAGES += \
   FMRadio \
   brcm-uim-sysfs \
   libfmradio.v4l2-fm

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(COMMON_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(COMMON_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(COMMON_PATH)/gps/sap.conf:system/etc/sap.conf

PRODUCT_PACKAGES += \
    gps.msm8974

# IPC Security Config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/sec_config:system/etc/sec_config

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/mhl-rcp.kl:system/usr/keylayout/mhl-rcp.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl:system/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl

# MAC address - BT and Wi-Fi
PRODUCT_PACKAGES += \
    macaddrsetup

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    com.android.nfc_extras \
    nfc_nci.pn54x.default

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Off mode charger
PRODUCT_PACKAGES += \
    charger_res_images

# Sensor file
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom-sensor.sh:system/etc/init.qcom-sensor.sh 

# BCM Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4339/device-bcm.mk)

# Include non-opensource parts
$(call inherit-product, vendor/sony/shinano-common/shinano-common-vendor.mk)
