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

# ========== 添加 MTK 闭源驱动 (MT7981) ==========
# 从专门仓库获取 MTK 驱动，支持 openwrt-22.03
git clone --depth=1 https://github.com/immortalwrt-mt798x/immortalwrt-mt798x package/mtk-driver

# ========== 添加 daed 源码 ==========
git clone https://github.com/kenzok8/openwrt-daede.git package/openwrt-daede

echo "DIY part 1 completed."
