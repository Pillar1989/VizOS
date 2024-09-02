# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 OpenWrt.org
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_RELEASE:=1
PKG_VERSION:=2021.10

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/draftbottle/uboot-sophgo
PKG_SOURCE_VERSION:=59f64ab3055253b2cc752391c3c6f37fa1f84e10
PKG_MIRROR_HASH=b87bfdaa37594e5bad9f2714073735effefc2bd19a31b9a7d41b98226c0134cd

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk


define Build/Prepare
    $(call Build/Prepare/Default)
	$(warning print....................... Build/Prepare: ${SUBTARGET} $$(DEVICE_DTS)  $(STAGING_DIR_IMAGE) )
	cp files/$(SUBTARGET)/$(BUILD_DEVICES)_defconfig $(PKG_BUILD_DIR)/configs/$(BUILD_VARIANT)_defconfig
	cp files/$(SUBTARGET)/dts/*.dts $(PKG_BUILD_DIR)/arch/riscv/dts/
	cp files/$(SUBTARGET)/dts/*.dtsi $(PKG_BUILD_DIR)/arch/riscv/dts/
	cp files/$(SUBTARGET)/dts/cvi_board_memmap.h $(PKG_BUILD_DIR)/arch/riscv/dts/
	cp files/$(SUBTARGET)/cvitek.h $(PKG_BUILD_DIR)/include/cvitek/
	cp files/$(SUBTARGET)/cvi_board_init.c $(PKG_BUILD_DIR)/board/cvitek
endef


define U-Boot/Default
	BUILD_TARGET:=sophgo
	BUILD_DEVICES=$(1)
	UBOOT_IMAGE:=u-boot.bin
	DTS_DIR:=arch/riscv/dts
	UENV:=default
endef

# sophgo boards

define U-Boot/huashanpi
	NAME:=Sophgo huashan pi
	UBOOT_DTS:=cv1812h_wevb_0007a_emmc.dtb
	BUILD_DEVICES:=cvitek_cv1812h_wevb_0007a_emmc
	UBOOT_MAKE_FLAGS := \
		CHIP=cv1812h \
		CVIBOARD=wevb_0007a_emmc \
		BOARD=cv181x \
		CHIP_SEGMENT=cv181x
endef

define U-Boot/milkvduo
	NAME:=Sophgo milk-v duo
	UBOOT_DTS:=cv1800b_milkv_duo_sd.dtb
	BUILD_DEVICES:=cvitek_cv1800b_milkv_duo_sd
	UBOOT_MAKE_FLAGS := \
		CHIP=cv1800b \
		CVIBOARD=milkv_duo_sd \
		BOARD=cv180x \
		CHIP_SEGMENT=cv180x
endef

define U-Boot/milkvduo256m
	NAME:=Sophgo milk-v duo256m
	UBOOT_DTS:=cv1812cp_milkv_duo256m_sd.dtb
	BUILD_DEVICES:=cvitek_cv1812cp_milkv_duo256m_sd
	UBOOT_MAKE_FLAGS := \
		CHIP=cv1812cp \
		CVIBOARD=milkv_duo256m_sd \
		BOARD=cv181x \
		CHIP_SEGMENT=cv181x
endef

define U-Boot/milkvduos
	NAME:=Sophgo milk-v duos
	UBOOT_DTS:=cv1813h_milkv_duos_sd.dtb
	BUILD_DEVICES:=cvitek_cv1813h_milkv_duos_sd
	UBOOT_MAKE_FLAGS := \
		CHIP=cv1813h \
		CVIBOARD=milkv_duos_sd \
		BOARD=cv181x \
		CHIP_SEGMENT=cv181x
endef


UBOOT_TARGETS := \
	huashanpi \
	milkvduo \
	milkvduo256m \
	milkvduos



define Build/InstallDev
	$(INSTALL_DIR) $(BIN_DIR)
	mkdir -p $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/u-boot.bin $(STAGING_DIR_IMAGE)/u-boot.bin
endef

$(eval $(call BuildPackage/U-Boot))
