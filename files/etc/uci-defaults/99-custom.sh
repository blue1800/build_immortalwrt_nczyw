#!/bin/sh
# Quickfile Nginx configuration
# 只有安装了 luci-app-quickfile 才执行

if [ -f /usr/bin/quickfile ]; then
    # 检查 nginx 包是否安装
    if command -v nginx >/dev/null 2>&1; then
        uci set nginx.global.uci_enable='true'
        uci del nginx._lan 2>/dev/null
        uci del nginx._redirect2ssl 2>/dev/null

        uci add nginx server
        uci rename nginx.@server[-1]='_lan'

        uci set nginx._lan.server_name='_lan'
        uci add_list nginx._lan.listen='80 default_server'
        uci add_list nginx._lan.listen='[::]:80 default_server'
        uci add_list nginx._lan.include='conf.d/*.locations'
        uci set nginx._lan.access_log='off; # logd openwrt'

        uci commit nginx
        
        # 重启 nginx 使配置生效
        /etc/init.d/nginx restart 2>/dev/null || true
        
        echo "fix quickfile nginx config" >> /tmp/quickfile-uci-defaults.log
    fi
fi

# 脚本执行成功，退出
exit 0
