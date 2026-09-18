#!/bin/sh
# Description: (After Update feeds) — 路由器出厂信息定制
# 对应原 P3TERX 模板里的 diy-part2.sh
#
# 重要：ImmortalWrt 24.10 源码树里 /etc/config/system 是由首次启动的
# config_generate 现生成的，package/base-files/files/etc/config/system 并不存在，
# 所以不能用 sed 改它，只能“创建”这个文件来固化主机名。

# ---- 默认 LAN IP：保持和你现有网关一致 192.168.1.1 ----
# 24.10 出厂默认就是 192.168.1.1；原仓库把它改成了 192.168.31.1，这里做无害化回退。
sed -i 's/192.168.31.1/192.168.1.1/g' package/base-files/files/bin/config_generate 2>/dev/null || true

# ---- DHCP 地址池（可选，找不到文件就跳过）----
sed -i "s/option start.*/option start '2'/g" package/network/services/dnsmasq/files/dhcp.conf 2>/dev/null || true
sed -i "s/option limit.*/option limit '55'/g" package/network/services/dnsmasq/files/dhcp.conf 2>/dev/null || true

# ---- 主机名：创建静态 /etc/config/system（24.10 源码里不存在该文件，必须自行生成）----
mkdir -p package/base-files/files/etc/config
cat > package/base-files/files/etc/config/system <<'EOF'
config system
	option hostname 'PC-20250616FAXN'
	option zonename 'Asia/Shanghai'
	option timezone 'CST-8'
EOF

# ---- 登录横幅（banner 文件在 24.10 源码里存在，可直接覆盖）----
cat > package/base-files/files/etc/banner <<'EOF'
北冥有鱼 · 定制版 ImmortalWrt
=========================================
  ImmortalWrt 24.10 · AX3000T
  北冥有鱼定制版 · UA3F + mwan3
EOF
