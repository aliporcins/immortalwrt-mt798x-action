#!/bin/bash
#
# diy-part2.sh
# Description: OpenWrt DIY script part 2 (After feeds install)
#

# ========== 1. 确保在 openwrt 目录下 ==========
if [ -d "$GITHUB_WORKSPACE/openwrt" ]; then
    cd $GITHUB_WORKSPACE/openwrt
fi

# ========== 2. 创建 clang 软链接 ==========
if ! command -v clang >/dev/null 2>&1; then
    sudo ln -sf /usr/bin/clang-15 /usr/bin/clang
    sudo ln -sf /usr/bin/clang++-15 /usr/bin/clang++
fi

# ========== 3. 修复 OpenClash GEOIP 源 ==========
if [ -d package/luci-app-openclash ]; then
    find package/luci-app-openclash -type f -name "*.lua" -exec sed -i 's|https://cdn.jsdelivr.net/gh|https://raw.githubusercontent.com|g' {} \;
    echo "✅ OpenClash GEOIP source fixed."
fi

# ========== 4. 确保 daed 依赖包被选中 ==========
if grep -q "CONFIG_PACKAGE_daed=y" .config 2>/dev/null; then
    echo "✅ daed is enabled, ensuring dependencies..."
    echo "CONFIG_PACKAGE_kmod-bpf=y" >> .config
    echo "CONFIG_PACKAGE_bpftool=y" >> .config
fi

echo "✅ DIY part 2 completed."
