#
# Copyright (C) 2020 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/infinix/X689

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    lk \
    preloader \
    product \
    system \
    vbmeta \
    system_ext \
    vbmeta_system \
    vendor
    
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# V A/B
ENABLE_VIRTUAL_AB := true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-recovery \
    android.hardware.boot@1.1-impl

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier \
    update_engine_sideload

# DFE
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.options=::v2

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock
