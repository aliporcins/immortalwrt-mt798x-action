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

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# 添加 daed 源码
git clone https://github.com/kenzok8/openwrt-daede.git package/openwrt-daede
# ========== 修复 OpenClash 的 GEOIP 数据下载源 ==========
# 将 raw.githubusercontent.com 替换为 ghproxy.net 代理
sed -i 's|raw.githubusercontent.com|ghproxy.net/https://raw.githubusercontent.com|g' feeds/luci/applications/luci-app-openclash/root/usr/share/openclash/geoip_dat_update.sh

# 将 github.com 的下载链接也替换为代理
sed -i 's|https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat|https://ghproxy.net/https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat|g' feeds/luci/applications/luci-app-openclash/root/usr/share/openclash/geoip_dat_update.sh
