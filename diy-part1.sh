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

# ========== 1. 修复编译环境（安装编译所需工具） ==========
# 安装 pahole（BTF 支持）和 clang 工具链
sudo apt-get update
sudo apt-get install -y pahole dwarves clang lld llvm

# ========== 2. 添加 MTK 闭源驱动 (MT7981) ==========
# 方法：将驱动作为自定义 feed 添加，而非直接 git clone 到 package/
echo "src-git mtk_driver https://github.com/padavanonly/immortalwrt-mt7981" >> feeds.conf.default

# ========== 3. 添加 daed 源码 ==========
# 使用正确的仓库地址（如果 kenzok8 的仓库可用）
echo "src-git daed https://github.com/kenzok8/openwrt-daede.git" >> feeds.conf.default
# 备用方案：如果上述仓库失效，可以使用：
# echo "src-git daed https://github.com/sbwml/openwrt-dae.git" >> feeds.conf.default

# ========== 4. 更新 feeds 并安装包 ==========
./scripts/feeds update -a
./scripts/feeds install -a

echo "DIY part 1 completed."
