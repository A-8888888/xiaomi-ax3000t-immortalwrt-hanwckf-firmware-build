#!/bin/sh
# Description: (Before Update feeds) — 加入自定义软件包源
# 对应原 P3TERX 模板里的 diy-part1.sh

# ---- UA3F：UA 改写插件（LuCI 路径：服务 → UA3F）----
git clone --depth 1 https://github.com/SunBK201/UA3F.git package/UA3F

# ---- Argon 主题 + 主题配置器（24.10 / 25.12 用 master 分支）----
git clone -b master --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 如需更多第三方源，照下面格式追加（取消注释即可）：
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >> feeds.conf.default
