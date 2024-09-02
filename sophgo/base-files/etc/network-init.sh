#
# please re-tab the ip-addr of this file
# 请按照自己的上级路由设置该文件，并运行
#

if ifconfig br-lan > /dev/null 2>&1; then
    ifconfig br-lan 192.168.1.129 up
else
    ifconfig eth0 192.168.1.129 up
fi

route add default gw 192.168.1.1

echo "nameserver 114.114.114.114" >> /etc/resolv.conf
 
echo "nameserver 233.5.5.5" >> /etc/resolv.conf
 
echo "nameserver 8.8.8.8" >> /etc/resolv.conf


