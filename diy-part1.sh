#!/bin/bash
#
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# ========== 添加 MTK 闭源驱动 ==========
# 使用 237 的驱动仓库（专门为 MT7981 优化）
git clone https://github.com/immortalwrt-mt798x/immortalwrt-mt798x package/mtk-driver

# 或者使用 1715173329 的驱动
# git clone https://github.com/1715173329/immortalwrt-mt798x package/mtk-driver

# ========== 添加 daed 源码 ==========
git clone https://github.com/kenzok8/openwrt-daede.git package/openwrt-daede
