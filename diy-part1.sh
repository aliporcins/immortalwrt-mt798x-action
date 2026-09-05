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

# ========== 1. 确保在 openwrt 目录下 ==========
if [ -d "$GITHUB_WORKSPACE/openwrt" ]; then
    cd $GITHUB_WORKSPACE/openwrt
fi

# ========== 2. 清空 feeds.conf.default（避免重复） ==========
> feeds.conf.default

# ========== 3. 添加 MTK 闭源驱动 (MT7981) 到 feeds ==========
# 修正仓库地址：padavanolly -> padavanonly
echo "src-git mtk_driver https://github.com/padavanonly/immortalwrt-mt7981" >> feeds.conf.default

# 备用源：如果 padavanonly 仓库不可用，使用 hanwckf 的仓库
# echo "src-git mtk_driver https://github.com/hanwckf/immortalwrt-mt798x" >> feeds.conf.default

# ========== 4. 添加 daed 源码到 feeds ==========
echo "src-git daed https://github.com/kenzok8/openwrt-daede.git" >> feeds.conf.default
# 备用源：
# echo "src-git daed https://github.com/sbwml/openwrt-dae.git" >> feeds.conf.default

# ========== 5. 显示 feeds 配置 ==========
echo "=== feeds.conf.default content ==="
cat feeds.conf.default

echo "✅ DIY part 1 completed."
