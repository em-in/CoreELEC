# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="aml-dtbtools"
PKG_VERSION="b2ca13c"
PKG_SHA256="12b8cd2c5909aca2a39f743129ea428ab05601350699e4804aec5ef42fcd24ab"
PKG_LICENSE="free"
PKG_SITE="https://github.com/Wilhansen/aml-dtbtools"
PKG_URL="https://github.com/Wilhansen/aml-dtbtools/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="AML DTB Tools"
PKG_DEPENDS_HOST="gcc:host"

PKG_MAKE_OPTS_HOST="dtbTool"

makeinstall_host() {
  mkdir -p $TOOLCHAIN/bin
    cp dtbTool $TOOLCHAIN/bin
}
