# SPDX-License-Identifier: GPL-2.0-only
define Device/milk-v-duos
  DEVICE_VENDOR := milkv.io
  DEVICE_MODEL := milkv-duos
  DEVICE_DTS_DIR := ${PWD}/cv1813h/dts
  DEVICE_DTS := cv1813h_milkv_duos_sd
endef
TARGET_DEVICES += milk-v-duos
