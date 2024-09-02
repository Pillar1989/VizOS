# SPDX-License-Identifier: GPL-2.0-only
define Device/huashanpi
	DEVICE_VENDOR := hw100k
	DEVICE_MODEL := huashanpi-cv1812h
	DEVICE_DTS_DIR := ${PWD}/cv181x/dts
	DEVICE_DTS := cv1812h_wevb_0007a_emmc
endef
TARGET_DEVICES += huashanpi

define Device/milk-v-duo256m
  DEVICE_VENDOR := milkv.io
  DEVICE_MODEL := milkv-duo256m
  DEVICE_DTS_DIR := ${PWD}/cv181x/dts
  DEVICE_DTS := cv1812cp_milkv_duo256m_sd
endef
TARGET_DEVICES += milk-v-duo256m

