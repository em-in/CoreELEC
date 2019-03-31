# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gcc-linaro-arm-linux-gnueabihf"
PKG_VERSION="7.4.1-2019.02"
PKG_SHA256="3c951cf1941d0fa06d64cc0d5e88612b209d8123b273fa26c16d70bd7bc6b163"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL="https://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/arm-linux-gnueabihf/gcc-linaro-${PKG_VERSION}-x86_64_arm-linux-gnueabihf.tar.xz"
PKG_DEPENDS_HOST="ccache:host"
PKG_LONGDESC="Linaro ARM GNU Linux Binary Toolchain"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  mkdir -p $TOOLCHAIN/lib/gcc-linaro-arm-linux-gnueabihf/
    cp -a * $TOOLCHAIN/lib/gcc-linaro-arm-linux-gnueabihf

  # wrap gcc and g++ with ccache like in gcc package.mk
  PKG_GCC_PREFIX="$TOOLCHAIN/lib/gcc-linaro-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-"

  cp "${PKG_GCC_PREFIX}gcc" "${PKG_GCC_PREFIX}gcc.real"
cat > "${PKG_GCC_PREFIX}gcc" << EOF
#!/bin/sh
$TOOLCHAIN/bin/ccache ${PKG_GCC_PREFIX}gcc.real "\$@"
EOF

  chmod +x "${PKG_GCC_PREFIX}gcc"

  cp "${PKG_GCC_PREFIX}g++" "${PKG_GCC_PREFIX}g++.real"
cat > "${PKG_GCC_PREFIX}g++" << EOF
#!/bin/sh
$TOOLCHAIN/bin/ccache ${PKG_GCC_PREFIX}g++.real "\$@"
EOF

  chmod +x "${PKG_GCC_PREFIX}g++"
}
