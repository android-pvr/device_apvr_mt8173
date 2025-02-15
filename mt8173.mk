#
# Copyright 2020 Android-RPi Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
USE_OEM_TV_APP := true
$(call inherit-product, device/google/atv/products/atv_base.mk)

PRODUCT_NAME := mt8173
PRODUCT_DEVICE := mt8173
PRODUCT_BRAND := apvr
PRODUCT_MANUFACTURER := APVR
PRODUCT_MODEL := MT8173

include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

PRODUCT_PROPERTY_OVERRIDES += \
    debug.drm.mode.force=1366x768 \
    gralloc.drm.kms=/dev/dri/card1 \
    ro.opengles.version=131072 \
    ro.hardware.vulkan=powervr_mesa \
    ro.hardware.egl=swiftshader \
    ro.hdmi.device_type=4

# application packages
PRODUCT_PACKAGES += \
    TvSettingsTwoPanel \
    DeskClock \
    RpLauncher

# overlay packages
PRODUCT_PACKAGES += \
    PvrFrameworkOverlay

# system packages
PRODUCT_PACKAGES += \
    memtrack.mt8173 \
    audio.primary.mt8173 \
    audio.usb.default

# graphics hal
PRODUCT_PACKAGES += \
    vulkan.powervr_mesa \
    libpowervr_rogue \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle \
    libEGL_swiftshader \
    libGLESv1_CM_swiftshader \
    libGLESv2_swiftshader

PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true

# hardware/interfaces
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.apvr \
    android.hardware.graphics.mapper@4.0-impl.apvr \
    android.hardware.graphics.composer-service.apvr \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.audio.service \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    android.hardware.gatekeeper@1.0-service.software \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    android.hardware.health.storage@1.0-service \
    android.hardware.wifi@1.0-service \
    android.hardware.configstore@1.1-service \
    android.hardware.tv.hdmi.connection-service \
    android.hardware.tv.hdmi.cec-service \
    android.hardware.tv.hdmi.earc-service \
    hwservicemanager \
    vndservicemanager

# system configurations
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    $(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/init.mt8173.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mt8173.rc \
    $(LOCAL_PATH)/init.mt8173.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mt8173.usb.rc \
    $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
    $(LOCAL_PATH)/fstab.mt8173:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt8173 \
    $(LOCAL_PATH)/fstab.mt8173:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt8173 \
    $(LOCAL_PATH)/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/firmware/powervr/rogue_4.40.2.51_v1.fw:root/lib/firmware/powervr/rogue_4.40.2.51_v1.fw \
    $(LOCAL_PATH)/firmware/powervr/rogue_4.40.2.51_v1.fw:$(TARGET_COPY_OUT_RAMDISK)/lib/firmware/powervr/rogue_4.40.2.51_v1.fw \
    $(PRODUCT_COPY_FILES)

# media configurations
PRODUCT_COPY_FILES := \
    device/generic/goldfish/camera/media/profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    device/generic/goldfish/camera/media/codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/base/data/sounds/effects/ogg/Effect_Tick_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Effect_Tick.ogg \
    frameworks/base/data/sounds/effects/ogg/camera_click_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/camera_click.ogg \
    $(PRODUCT_COPY_FILES)

PRODUCT_AAPT_PREF_CONFIG := tvdpi
PRODUCT_CHARACTERISTICS := tv

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
