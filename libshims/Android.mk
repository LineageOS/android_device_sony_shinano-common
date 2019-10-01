#
# Copyright (C) 2016 The LineageOS Project
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

LOCAL_PATH := $(call my-dir)


# libshim_camera
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    ui/GraphicBuffer.cpp \
    ui/GraphicBufferAllocator.cpp \
    ui/GraphicBufferMapper.cpp \
    utils/Looper.cpp \
    utils/VectorImpl.cpp

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    system/core/libutils \
    system/core/libgrallocusage/include \
    frameworks/native/libs/vr/libdvr/include

LOCAL_SHARED_LIBRARIES := \
    android.frameworks.bufferhub@1.0 \
    android.hardware.graphics.allocator@2.0 \
    android.hardware.graphics.allocator@3.0 \
    android.hardware.graphics.common@1.2 \
    android.hardware.graphics.mapper@2.0 \
    android.hardware.graphics.mapper@2.1 \
    android.hardware.graphics.mapper@3.0 \
    libbase \
    libcutils \
    libhardware \
    libhidlbase \
    libsync \
    libui \
    libutils \
    liblog

LOCAL_MODULE := libshim_camera

LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
