##
## network settings
##
echo "first init bash?(y or n)"
read answer

case "$answer" in
"y"|\
"Y")

echo "请输入您自定义的设备静态ip地址(Please enter the static IP address you defined for the duo-board):"
read ipaddr

if [ -z "$ipaddr" ]; then
    echo 'ipaddress is 192.168.1.129'
elif [ ipaddr != "192.168.1.129" ]; then
    sed -i 's/192.168.1.129/$(ipaddr)/g' /etc/network-init.sh
else
    echo 'ipaddress is 192.168.1.129'
fi

echo "请输入您路由器或网关的ip地址(Please enter the IP address of your router or gateway):"
read gwaddr

if [ -z "$ipaddr" ]; then
    echo 'gwaddr is 192.168.1.1'
elif [gwaddr != "192.168.1.1"]; then
    sed -i 's/192.168.1.1/$(gwaddr)/g' /etc/network-init.sh
else
    echo 'gwaddr is 192.168.1.1'
fi
;;
*)
    echo "initial..."
;;
esac

chmod +x /etc/network-init.sh
. /etc/network-init.sh

sleep 5
sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
apk add -X https://mirrors.tuna.tsinghua.edu.cn/alpine/latest-stable/main -u alpine-keys  --allow-untrusted

opkg update
apk update
echo 'Installing the necessary packages...'
apk add musl busybox busybox-binsh apk-tools

echo "THE opkg AND apk application-manage-app UPDATE FINISH!"

# 安装luci,可注释
# opkg install luci

echo "The network setup OK!"

##
##  kmod setting # 已解决此问题,故弃用
##
# target_dir='/lib/modules/5.10.4-tag-'
# if [ -d target_dir ]; then
#    echo "Welcome to use Duo64m Openwrt."
# else
#    ln -s /lib/modules/5.10.4 /lib/modules/$(uname -r)
#    kmodloader
#    echo "Welcome to use Duo Openwrt."
# fi
