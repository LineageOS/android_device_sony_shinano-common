#
# Copyright (C) 2019 The LineageOS Project
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

LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR_PLATFORM),shinano)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)

WCD9320_BIN := wcd9320_anc.bin wcd9320_mad_audio.bin mbhc.bin
WCD9320_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/wcd9320/,$(notdir $(WCD9320_BIN)))
$(WCD9320_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WCD9320 bin link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/audio/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCD9320_SYMLINKS)

endif
