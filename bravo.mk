#
# Copyright (C) 2009 The Android Open Source Project
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
#

#
# This is the product configuration for a generic GSM bravo,
# not specialized for any geography.
#

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/bravo/init.bravo.rc:root/init.bravo.rc

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=60

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# This is a high density device with more memory, so larger vm heaps for it.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/bravo/bravo-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.media.dec.jpeg.memcap=20000000

DEVICE_PACKAGE_OVERLAYS += device/htc/bravo/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/bravo/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    sensors.bravo \
    lights.bravo \
    librs_jni \
    gralloc.qsd8k \
    copybit.qsd8k \
    bravo-keypad.kcm \
    gps.bravo \
    libOmxCore \
    libOmxVidEnc

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Bravo uses high-density artwork where available
PRODUCT_LOCALES := hdpi

PRODUCT_COPY_FILES += \
    device/htc/bravo/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravo/vold.fstab:system/etc/vold.fstab

ifdef RX_KERNEL

PRODUCT_COPY_FILES += \
	device/htc/bravo/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

LOCAL_KERNEL := device/htc/bravo/rxKernel

else

PRODUCT_COPY_FILES += \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/kernel/drivers/net/wireless/bcm4329/bcm4329.ko:system/lib/modules/2.6.37.4-redux-CFS-SVS/kernel/drivers/net/wireless/bcm4329/bcm4329.ko \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.alias:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.alias \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.alias.bin:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.alias.bin \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.builtin:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.builtin \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.builtin.bin:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.builtin.bin \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.ccwmap:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.ccwmap \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.dep:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.dep \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.dep.bin:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.dep.bin \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.devname:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.devname \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.ieee1394map:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.ieee1394map \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.inputmap:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.inputmap \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.isapnpmap:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.isapnpmap \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.ofmap:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.ofmap \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.order:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.order \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.pcimap:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.pcimap \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.seriomap:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.seriomap \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.softdep:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.softdep \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.symbols:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.symbols \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.symbols.bin:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.symbols.bin \
    device/htc/bravo/rx-kernel/system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.usbmap:system/lib/modules/2.6.37.4-redux-CFS-SVS/modules.usbmap \
    device/htc/bravo/rx-kernel/system/lib/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

LOCAL_KERNEL := device/htc/bravo/rx-kernel/kernel
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Broadcom FM radio
$(call inherit-product, device/htc/bravo/fm_radio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)
