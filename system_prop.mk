# aDSP sensors
## max rate
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.max_accel_rate=false \
    ro.qti.sensors.max_gyro_rate=false \
    ro.qti.sensors.max_mag_rate=false \
    ro.qti.sensors.max_geomag_rotv=50

## sensor type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sdk.sensors.gestures=false \
    ro.qti.sensors.pedometer=false \
    ro.qti.sensors.step_detector=true \
    ro.qti.sensors.step_counter=true \
    ro.qti.sensors.pam=false \
    ro.qti.sensors.scrn_ortn=false \
    ro.qti.sensors.smd=false \
    ro.qti.sensors.game_rv=true \
    ro.qti.sensors.georv=true \
    ro.qti.sensors.cmc=false \
    ro.qti.sensors.bte=false \
    ro.qti.sensors.fns=false \
    ro.qti.sensors.qmd=false \
    ro.qti.sensors.amd=false \
    ro.qti.sensors.rmd=false \
    ro.qti.sensors.vmd=false \
    ro.qti.sensors.gtap=false \
    ro.qti.sensors.tap=false \
    ro.qti.sensors.facing=false \
    ro.qti.sensors.tilt=false \
    ro.qti.sensors.tilt_detector=true \
    ro.qti.sensors.dpc=false \
    ro.qti.sensors.wu=false

# Assertive Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qcom.ad=1 \
    ro.qcom.ad.calib.data=/vendor/etc/ad_calib.cfg

# Audio HAL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.audiorec=true \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=none

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.a2dp.sink.enabled=false \
    ro.bluetooth.hfp.ver=1.6 \
    ro.bt.bdaddr_path="/data/vendor/bluetooth/bluetooth_bdaddr" \
    ro.rfkilldisabled=1

# macaddrsetup
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.addr_path="/sys/devices/platform/bcmdhd_wlan/macaddr"

# Semc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.semc.version.sw_revision=23.5.A.1.291 \
    ro.semc.version.sw_variant=GLOBAL-LTECA \
    ro.semc.version.sw_type=user \
    ro.semc.version.fs_revision=23.5.A.1.291 \
    ro.semc.version.fs=GENERIC
