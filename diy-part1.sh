#!/bin/bash

# ========== 添加 MTK 闭源驱动 (MT7981) ==========
# 使用 padavanonly 的驱动仓库（支持 6.x 内核）
git clone --depth=1 https://github.com/padavanonly/immortalwrt-mt7981 package/mtk-driver

# ========== 添加 daed 源码 ==========
git clone https://github.com/kenzok8/openwrt-daede.git package/openwrt-daede

echo "DIY part 1 completed."
