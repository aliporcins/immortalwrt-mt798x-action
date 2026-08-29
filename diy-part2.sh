#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# ========== 修复 OpenClash 的 GEOIP 数据下载源 ==========
# 在 feeds 更新后，OpenClash 的脚本文件已经存在

OPENCLASH_GEOIP_SCRIPT="feeds/luci/applications/luci-app-openclash/root/usr/share/openclash/geoip_dat_update.sh"

if [ -f "$OPENCLASH_GEOIP_SCRIPT" ]; then
    # 使用 ghfast.top 作为代理（比 ghproxy.net 更稳定）
    sed -i 's|raw.githubusercontent.com|ghfast.top/raw.githubusercontent.com|g' "$OPENCLASH_GEOIP_SCRIPT"
    sed -i 's|https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat|https://ghfast.top/https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat|g' "$OPENCLASH_GEOIP_SCRIPT"
    echo "OpenClash GEOIP source fixed."
else
    echo "Warning: OpenClash GEOIP script not found, skipping."
fi
