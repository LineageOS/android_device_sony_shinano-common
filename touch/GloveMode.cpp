/*
 * Copyright (C) 2019 The LineageOS Project
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

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/strings.h>

#include "GloveMode.h"

namespace vendor {
namespace lineage {
namespace touch {
namespace V1_0 {
namespace implementation {

constexpr const char kGlovePath[] =
    "/sys/devices/virtual/input/clearpad/glove";
constexpr const char kGlovePathAlt[] =
    "/sys/devices/f9964000.i2c/i2c-8/8-0048/glove";

GloveMode::GloveMode() {
    mHasGloveMode = false;

    if (access(kGlovePath, F_OK)) {
        mHasGloveMode = true;
        mGloveSysfsPath = kGlovePath;
    }
    else if (access(kGlovePathAlt, F_OK)) {
        mHasGloveMode = true;
        mGloveSysfsPath = kGlovePathAlt;
    }
}

// Methods from ::vendor::lineage::touch::V1_0::IGloveMode follow.
Return<bool> GloveMode::isEnabled() {
    std::string buf;

    if (!mHasGloveMode) return false;

    if (!android::base::ReadFileToString(mGloveSysfsPath, &buf)) {
        LOG(ERROR) << "Failed to read " << mGloveSysfsPath;
        return false;
    }

    return std::stoi(android::base::Trim(buf)) == 0;
}

Return<bool> GloveMode::setEnabled(bool enabled) {
    if (!mHasGloveMode) return false;

    if (!android::base::WriteStringToFile((enabled ? "1" : "0"), mGloveSysfsPath)) {
        LOG(ERROR) << "Failed to write " << mGloveSysfsPath;
        return false;
    }

    return true;
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace touch
}  // namespace lineage
}  // namespace vendor
