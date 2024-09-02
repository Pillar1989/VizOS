#
# Copyright (C) 2009 OpenWrt.org
#

SUBTARGET:=cv1813h
BOARDNAME:=cv1813h based boards
DTSDIR:=cvitek

DEVICE_PACKAGES := u-boot-milkvduos


define Target/Description
	Build firmware images for sophgo cv181x based boards.
endef

