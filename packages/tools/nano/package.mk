# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="nano"
PKG_VERSION="4.0"
PKG_SHA256="1e2fcfea35784624a7d86785768b772d58bb3995d1aec9176a27a113b1e9bac3"
PKG_LICENSE="GPL"
PKG_SITE="http://www.nano-editor.org/"
PKG_URL="http://ftpmirror.gnu.org/nano/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain ncurses"
PKG_LONGDESC="Nano is an enhanced clone of the Pico text editor."

PKG_CONFIGURE_OPTS_TARGET="--disable-utf8 \
                           --disable-nls \
                           --disable-libmagic \
                           --disable-wrapping"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share/nano
}
