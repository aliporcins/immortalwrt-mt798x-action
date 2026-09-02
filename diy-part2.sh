#!/bin/bash
#
# diy-part2.sh
# Description: OpenWrt DIY script part 2 (After feeds install)
#

# ========== 1. 确保工作在 openwrt 目录下 ==========
if [ -d "$GITHUB_WORKSPACE/openwrt" ]; then
    cd $GITHUB_WORKSPACE/openwrt
fi

# ========== 2. 创建 clang 软链接（如果工作流中未设置） ==========
# 若工作流中已通过 update-alternatives 设置，此步骤可省略，但保留以防万一
if ! command -v clang >/dev/null 2>&1; then
    sudo ln -sf /usr/bin/clang-15 /usr/bin/clang
    sudo ln -sf /usr/bin/clang++-15 /usr/bin/clang++
fi

# ========== 3. 修复 OpenClash GEOIP 源 ==========
# 将 cdn.jsdelivr.net 替换为 raw.githubusercontent.com，避免下载失败
if [ -d package/luci-app-openclash ]; then
    find package/luci-app-openclash -type f -name "*.lua" -exec sed -i 's|https://cdn.jsdelivr.net/gh|https://raw.githubusercontent.com|g' {} \;
fi

# ========== 4. 禁用 v2ray-geodata 和 bpf-headers（在 .config 中已设置） ==========
# 无需额外操作，这里仅作提醒
echo "DIY part 2 completed."
