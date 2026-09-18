#!/bin/sh
# Description: (After Update feeds) — 路由器出厂信息定制
# 对应原 P3TERX 模板里的 diy-part2.sh

# ---- 默认 LAN IP：保持和你现有网关一致 192.168.1.1 ----
# 原仓库把这行改成了 192.168.31.1，这里改回 192.168.1.1
sed -i 's/192.168.31.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# ---- DHCP 地址池（保持默认范围）----
sed -i "s/option start.*/option start '2'/g" package/network/services/dnsmasq/files/dhcp.conf
sed -i "s/option limit.*/option limit '55'/g" package/network/services/dnsmasq/files/dhcp.conf

# ---- 主机名 ----
sed -i "s/hostname 'OpenWrt'/hostname 'PC-20250616FAXN'/" package/base-files/files/etc/config/system

# ---- 登录横幅 ----
cat > package/base-files/files/etc/banner <<'EOF'
北冥有鱼 · 定制版 ImmortalWrt
=========================================
  ImmortalWrt 24.10 · AX3000T
  北冥有鱼定制版 · UA3F + mwan3
EOF
