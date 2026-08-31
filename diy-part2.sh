#!/bin/bash
#
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# ========== 创建 clang 软链接（修复硬编码路径） ==========
sudo mkdir -p /invalid
sudo ln -sf $(which clang-15) /invalid/clang 2>/dev/null || sudo ln -sf /usr/bin/clang-15 /invalid/clang
sudo ln -sf $(which clang++-15) /invalid/clang++ 2>/dev/null || sudo ln -sf /usr/bin/clang++-15 /invalid/clang++
echo "Clang symlink created: $(ls -la /invalid/clang)"

# ========== 修复 OpenClash 的 GEOIP 数据下载源 ==========
OPENCLASH_GEOIP_SCRIPT="feeds/luci/applications/luci-app-openclash/root/usr/share/openclash/geoip_dat_update.sh"
if [ -f "$OPENCLASH_GEOIP_SCRIPT" ]; then
    sed -i 's|raw.githubusercontent.com|ghfast.top/raw.githubusercontent.com|g' "$OPENCLASH_GEOIP_SCRIPT"
    sed -i 's|https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat|https://ghfast.top/https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat|g' "$OPENCLASH_GEOIP_SCRIPT"
    echo "OpenClash GEOIP source fixed."
fi

# ========== 禁用 v2ray-geodata 编译 ==========
sed -i '/v2ray-geodata/d' .config 2>/dev/null || true
echo "CONFIG_PACKAGE_v2ray-geoip=n" >> .config
echo "CONFIG_PACKAGE_v2ray-geosite=n" >> .config

# ========== 禁用 bpf-headers（如果软链接不生效） ==========
echo "CONFIG_PACKAGE_kmod-bpf-headers=n" >> .config
echo "CONFIG_PACKAGE_kmod-bpf-test=n" >> .config

# ========== 直接修改 Makefile 中的 clang 路径 ==========
find . -name "Makefile" -path "*/bpf-headers/*" -exec sed -i 's|/invalid/clang|/usr/bin/clang|g' {} \; 2>/dev/null || true

echo "DIY part 2 completed."
