#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/YUN
	NAME:=Arduino Yun
	PACKAGES:=kmod-usb-core kmod-usb2
endef

define Profile/YUN/Description
	Package set optimized for the Arduino Yun.
endef

$(eval $(call Profile,YUN))



