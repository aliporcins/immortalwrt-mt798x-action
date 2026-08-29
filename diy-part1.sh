#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# ========== 添加 MTK 闭源驱动 ==========
# 从 hanwckf 仓库提取 MTK 驱动相关包
git clone --depth=1 -b openwrt-21.02 https://github.com/hanwckf/immortalwrt-mt798x package/hanwckf-mt798x

# 只保留必要的驱动目录（如果克隆了整个仓库，需要复制驱动到正确位置）
# 或者使用更精确的驱动源：
# git clone https://github.com/hanwckf/mt798x-wifi-pkg package/mtk-wifi

# ========== 添加 daed 源码 ==========
git clone https://github.com/kenzok8/openwrt-daede.git package/openwrt-daede
