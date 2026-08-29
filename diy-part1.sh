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
# ========== 修复 v2ray-geodata 下载源 ==========
# 替换失效的 GitHub 下载链接为可用的 CDN 镜像
sed -i 's|https://github.com/v2fly/geoip/releases/latest/download/geoip.dat|https://cdn.jsdelivr.net/gh/v2fly/geoip@release/geoip.dat|g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's|https://github.com/v2fly/geosite/releases/latest/download/geosite.dat|https://cdn.jsdelivr.net/gh/v2fly/geosite@release/geosite.dat|g' feeds/packages/net/v2ray-geodata/Makefile
