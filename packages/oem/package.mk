# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="oem"
PKG_VERSION=""
PKG_LICENSE="various"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain $PROJECT"
PKG_SECTION="virtual"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"

# tools
PKG_DEPENDS_TARGET+=" MC"
