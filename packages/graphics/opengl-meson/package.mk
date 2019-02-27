# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="opengl-meson"
PKG_ARCH="arm"
PKG_LICENSE="nonfree"
PKG_SITE="http://openlinux.amlogic.com:8000/download/ARM/filesystem/"
PKG_VERSION="7bddce621a0c1e0cc12cfc8b707e93eb37fc0f82"
PKG_SHA256="15400e78b918b15743b815c195be472899d4243143e405a7b50d5be1cd07ffd1"
PKG_URL="https://github.com/CoreELEC/opengl-meson/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="OpenGL ES pre-compiled libraries for Mali GPUs found in Amlogic Meson SoCs."
PKG_TOOLCHAIN="manual"

makeinstall_target() {

 mkdir -p $SYSROOT_PREFIX/usr/include
   cp -PR include/* $SYSROOT_PREFIX/usr/include
   mv $SYSROOT_PREFIX/usr/include/EGL_platform/platform_fbdev/* $SYSROOT_PREFIX/usr/include/EGL/

 mkdir -p $SYSROOT_PREFIX/usr/lib
   cp -PR lib/eabihf/m450/r5p0/libMali.so $SYSROOT_PREFIX/usr/lib

   ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libEGL.so.1.4
   ln -sf libEGL.so.1.4 $SYSROOT_PREFIX/usr/lib/libEGL.so.1
   ln -sf libEGL.so.1 $SYSROOT_PREFIX/usr/lib/libEGL.so

   ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libGLESv1_CM.so.1.1
   ln -sf libGLESv1_CM.so.1.1 $SYSROOT_PREFIX/usr/lib/libGLESv1_CM.so.1
   ln -sf libGLESv1_CM.so.1 $SYSROOT_PREFIX/usr/lib/libGLESv1_CM.so

   ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libGLESv2.so.2.0
   ln -sf libGLESv2.so.2.0 $SYSROOT_PREFIX/usr/lib/libGLESv2.so.2
   ln -sf libGLESv2.so.2 $SYSROOT_PREFIX/usr/lib/libGLESv2.so


  mkdir -p $INSTALL/usr/lib/m450/
  mkdir -p $INSTALL/usr/lib/gondul/
    cp -PR lib/eabihf/m450/r5p0/libMali.so $INSTALL/usr/lib/m450/
    cp -PR lib/eabihf/gondul/r12p0/fbdev/libMali.so $INSTALL/usr/lib/gondul/

   ln -sf /var/lib/libMali.so $INSTALL/usr/lib/libMali.so
   ln -sf /var/lib/libEGL.so $INSTALL/usr/lib/libEGL.so
   ln -sf /usr/lib/libEGL.so $INSTALL/usr/lib/libEGL.so.1
   ln -sf /usr/lib/libEGL.so $INSTALL/usr/lib/libEGL.so.1.0.0
   ln -sf /var/lib/libGLESv1_CM.so $INSTALL/usr/lib/libGLESv1_CM.so
   ln -sf /usr/lib/libGLESv1_CM.so $INSTALL/usr/lib/libGLESv1_CM.so.1
   ln -sf /usr/lib/libGLESv1_CM.so $INSTALL/usr/lib/libGLESv1_CM.so.1.1
   ln -sf /usr/lib/libGLESv1_CM.so $INSTALL/usr/lib/libGLESv1_CM.so.1.0.1
   ln -sf /var/lib/libGLESv2.so $INSTALL/usr/lib/libGLESv2.so
   ln -sf /usr/lib/libGLESv2.so $INSTALL/usr/lib/libGLESv2.so.2
   ln -sf /usr/lib/libGLESv2.so $INSTALL/usr/lib/libGLESv2.so.2.0
   ln -sf /usr/lib/libGLESv2.so $INSTALL/usr/lib/libGLESv2.so.2.0.0
   ln -sf /var/lib/libGLESv3.so $INSTALL/usr/lib/libGLESv3.so
   ln -sf /usr/lib/libGLESv3.so $INSTALL/usr/lib/libGLESv3.so.3
   ln -sf /usr/lib/libGLESv3.so $INSTALL/usr/lib/libGLESv3.so.3.0
   ln -sf /usr/lib/libGLESv3.so $INSTALL/usr/lib/libGLESv3.so.3.0.0

  mkdir -p $INSTALL/usr/sbin
    cp $PKG_DIR/scripts/libmali-overlay-setup $INSTALL/usr/sbin
}

post_install() {
  enable_service libmali.service
}
