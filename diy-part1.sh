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

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git kiddin9 https://github.com/kiddin9/openwrt-packages' >>feeds.conf.default
#echo 'src-git kenzok8 https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
#echo 'src-git innmonkey https://github.com/innmonkey/openwrt-packages' >>feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default
sed -i '1i src-git rtp2httpd https://github.com/stackia/rtp2httpd.git;main' feeds.conf.default

#编译immortalwrt固件的插件rtp2httpd代码
# 进入openwrt目录
#cd openwrt || exit 1

# 设置自定义包目录
#CUSTOM_DIR="package/mypackages"  # 使用更明确的目录名
#mkdir -p "${CUSTOM_DIR}"

# 克隆源码
#git clone https://github.com/stackia/rtp2httpd.git package/stackia/rtp2httpd

# 移动文件
#mv -vf package/stackia/rtp2httpd/openwrt-support/luci-app-rtp2httpd/ "${CUSTOM_DIR}/"
#mv -vf package/stackia/rtp2httpd/openwrt-support/rtp2httpd/ "${CUSTOM_DIR}/"

# 清理
#rm -rf package/stackia/

# 重命名Makefile
#mv -vf "${CUSTOM_DIR}/luci-app-rtp2httpd/Makefile.versioned" "${CUSTOM_DIR}/luci-app-rtp2httpd/Makefile"
#mv -vf "${CUSTOM_DIR}/rtp2httpd/Makefile.versioned" "${CUSTOM_DIR}/rtp2httpd/Makefile"

# 返回上级目录(可选)
#cd - || exit 1


#echo 'src-git-full rtp2httpd https://github.com/stackia/rtp2httpd.git;main' >> feeds.conf.default
#echo 'src-git rtp2httpd https://github.com/stackia/rtp2httpd.git;main' >> feeds.conf.default
#echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main' >> feeds.conf.default
