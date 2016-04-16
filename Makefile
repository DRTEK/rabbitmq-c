# Copyright (C) 2006-2010 OpenWrt.org
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.


include $(TOPDIR)/rules.mk

PKG_NAME:=rabbitmq-c
PKG_VERSION:=0.8.0
PKG_RELEASE:=0

PKG_SOURCE:=v0.8.0.tar.gz
PKG_SOURCE_URL:=https://github.com/alanxz/rabbitmq-c/archive/

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += $(FPIC)

define Package/librabbitmq-c
   SECTION:=libs
   CATEGORY:=Libraries
   TITLE:=librabbitmq-c
   DEPENDS:=+libstdcpp +libpthread +libopenssl
endef
define Package/librabbitmq-c/description
 This package contains a library for rabbitmq-c client.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librabbitmq.* $(1)/usr/lib/
endef

define Package/librabbitmq-c/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librabbitmq.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,librabbitmq-c))
