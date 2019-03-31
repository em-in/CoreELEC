# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="dtc"
PKG_VERSION="1.4.7"
PKG_SHA256="f999e4a0238aeda1cbb452528670f7f37e7789e85f9b061f2cfff425a283ef1f"
PKG_LICENSE="GPL"
PKG_SITE="https://git.kernel.org/pub/scm/utils/dtc/dtc.git/"
PKG_URL="https://git.kernel.org/pub/scm/utils/dtc/dtc.git/snapshot/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python2:host swig:host"
PKG_DEPENDS_TARGET="toolchain dtc:host"
PKG_LONGDESC="The Device Tree Compiler"

PKG_MAKE_OPTS_HOST="dtc libfdt"
PKG_MAKE_OPTS_TARGET="dtc fdtput fdtget libfdt"

makeinstall_host() {
  mkdir -p $TOOLCHAIN/bin
    cp -P $PKG_BUILD/dtc $TOOLCHAIN/bin
    cp -P $PKG_BUILD/libfdt/libfdt.so $TOOLCHAIN/lib/
}

post_makeinstall_host() {
  python ./pylibfdt/setup.py build_ext --inplace
  python ./pylibfdt/setup.py install --prefix=$TOOLCHAIN

  touch $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/site-packages/pylibfdt/__init__.py
}

pre_make_target() {
  make clean BIN=
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_BUILD/dtc $INSTALL/usr/bin
    cp -P $PKG_BUILD/fdtput $INSTALL/usr/bin/
    cp -P $PKG_BUILD/fdtget $INSTALL/usr/bin/
  mkdir -p $INSTALL/usr/lib
    cp -P $PKG_BUILD/libfdt/libfdt.so $INSTALL/usr/lib/
}
