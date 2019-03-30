# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2011 Stephan Raue (stephan@openelec.tv)

PKG_NAME="whois"
PKG_VERSION="5.4.2"
PKG_SHA256="d928b981dc949a2ea1d0512d20da74707953369f889a88d8f84f1a4b05b822d2"
PKG_LICENSE="GPL"
PKG_SITE="http://www.linux.it/~md/software/"
PKG_URL="https://github.com/rfc1036/whois/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A tool that queries the whois directory service for information pertaining to a particular domain name."

make_target() {
  make mkpasswd
}

makeinstall_target() {
  : # nop
}
