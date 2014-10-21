/*
 * Copyright (C) 2013-2014, The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* From kernel */
#include <sound/tfa98xx.h>

#define TFA9890_DEVICE "/dev/tfa98xx"

#define PATCH_DSP_FILE "/system/etc/tfa98xx/TFA9890.patch"
#define PATCH_COLDBOOT_FILE "/system/etc/tfa98xx/coldboot.patch"

#define CONFIG_TOP "/system/etc/tfa98xx/TFA9890_top.config"
#define CONFIG_BTM "/system/etc/tfa98xx/TFA9890_btm.config"

#define SPEAKER_TOP "/system/etc/tfa98xx/top.speaker"
#define SPEAKER_BTM "/system/etc/tfa98xx/btm.speaker"

#define PRESET_HIFISPEAKER_TOP "/system/etc/tfa98xx/HiFiSpeaker_top.preset"
#define PRESET_HIFISPEAKER_BOTTOM "/system/etc/tfa98xx/HiFiSpeaker_btm.preset"
#define PRESET_HIFISPEAKER_RING_TOP "/system/etc/tfa98xx/HiFiSpeakerRing_top.preset"
#define PRESET_HIFISPEAKER_RING_BOTTOM "/system/etc/tfa98xx/HiFiSpeakerRing_btm.preset"
#define PRESET_HIFISPEAKER_SFORCE_TOP "/system/etc/tfa98xx/HiFiSpeakerSforce_top.preset"
#define PRESET_HIFISPEAKER_SFORCE_BOTTOM "/system/etc/tfa98xx/HiFiSpeakerSforce_btm.preset"
#define PRESET_VOICECALLSPEAKER_TOP "/system/etc/tfa98xx/VoiceCallSpeaker_top.preset"
#define PRESET_VOICECALLSPEAKER_BOTTOM "/system/etc/tfa98xx/VoiceCallSpeaker_btm.preset"
#define PRESET_FMSPEAKER_TOP "/system/etc/tfa98xx/FMSpeaker_top.preset"
#define PRESET_FMSPEAKER_BOTTOM "/system/etc/tfa98xx/FMSpeaker_btm.preset"
#define PRESET_VOICECALLEARPICE_TOP "/system/etc/tfa98xx/VoiceCallEarpice_top.preset"

#define EQ_HIFISPEAKER_TOP "/system/etc/tfa98xx/HiFiSpeaker_top.eq"
#define EQ_HIFISPEAKER_BOTTOM "/system/etc/tfa98xx/HiFiSpeaker_btm.eq"
#define EQ_HIFISPEAKER_RING_TOP "/system/etc/tfa98xx/HiFiSpeakerRing_top.eq"
#define EQ_HIFISPEAKER_RING_BOTTOM "/system/etc/tfa98xx/HiFiSpeakerRing_btm.eq"
#define EQ_HIFISPEAKER_SFORCE_TOP "/system/etc/tfa98xx/HiFiSpeakerSforce_top.eq"
#define EQ_HIFISPEAKER_SFORCE_BOTTOM "/system/etc/tfa98xx/HiFiSpeakerSforce_btm.eq"
#define EQ_VOICECALLSPEAKER_TOP "/system/etc/tfa98xx/VoiceCallSpeaker_top.eq"
#define EQ_VOICECALLSPEAKER_BOTTOM "/system/etc/tfa98xx/VoiceCallSpeaker_btm.eq"
#define EQ_FMSPEAKER_TOP "/system/etc/tfa98xx/FMSpeaker_top.eq"
#define EQ_FMSPEAKER_BOTTOM "/system/etc/tfa98xx/FMSpeaker_btm.eq"
#define EQ_VOICECALLEARPICE_TOP "/system/etc/tfa98xx/VoiceCallEarpice_top.eq"

#define TFA9890_IOCTL(ioctltype, filename, filetype) \
	ret = tfa9890_prepare_for_ioctl(filename, filetype); \
	if (ret > 0) { \
		ioctl(fd, ioctltype, &tfa9890_param_data); \
	} else { \
		goto error; \
	}

int tfa9890_init(void);
