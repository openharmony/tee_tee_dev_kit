# Copyright (C) 2026 Huawei Technologies Co., Ltd.
# Licensed under the Mulan PSL v2.
# You can use this software according to the terms and conditions of the Mulan
# PSL v2.
# You may obtain a copy of Mulan PSL v2 at:
#     http://license.coscl.org.cn/MulanPSL2
# THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY
# KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
# NON-INFRINGEMENT, MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
# See the Mulan PSL v2 for more details.

set(TEE_OH_PATH $ENV{TEE_OH_PATH})
set(TEE_OH_BUILD_PATH $ENV{TEE_OH_BUILD_PATH})

include (${TEE_OH_BUILD_PATH}/cmake_ide/common_flags.cmake)

set(COMMON_INCLUDES_FLAGS
    ${COMMON_INCLUDES_FLAGS}
    "-I${TEE_OH_PATH}/sysroot/usr/include/TEEKit/tee"
)

if (NOT "${TARGET_IS_ARM64}" STREQUAL "y")
    message(FATAL_ERROR "32-bit TA compilation is not supported")

else()
    list(APPEND COMMON_INCLUDES_FLAGS
        "-I${TEE_OH_PATH}/sysroot/usr/include/"
        "-I${TEE_OH_PATH}/sysroot/usr/include/aarch64-linux-ohos/"
    )

    list(APPEND COMMON_LDFLAGS
        "-T${TEE_OH_BUILD_PATH}/ld/ta_link_64.ld"
    )
endif()
