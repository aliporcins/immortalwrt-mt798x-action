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

# ========== 1. 确保工作在 openwrt 目录下 ==========
if [ -d "$GITHUB_WORKSPACE/openwrt" ]; then
    cd $GITHUB_WORKSPACE/openwrt
fi

# ========== 2. 添加 MTK 闭源驱动 (MT7981) 到 feeds ==========
# 使用 padavanonly 的驱动仓库
echo "src-git mtk_driver https://github.com/padavanonly/immortalwrt-mt7981" >> feeds.conf.default

# ========== 3. 添加 daed 源码到 feeds ==========
# 使用 kenzok8 的仓库（如果不可用，请自行替换为有效源）
echo "src-git daed https://github.com/kenzok8/openwrt-daede.git" >> feeds.conf.default
# 备用源（若上面失效，可取消下面一行的注释并注释掉上面那行）：
# echo "src-git daed https://github.com/sbwml/openwrt-dae.git" >> feeds.conf.default

echo "DIY part 1 completed."
