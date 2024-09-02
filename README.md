## *VizOS is an open-source IP Camera OS based on OpenWrt*
#### istoreos仓库现已添加build.sh脚本，您可以直接使用该脚本编译Duo-openwrt.

注意:如果是duo256m的开发板,你需要在烧录好以后，打开sd卡，进入boot目录，将你的可用的boot.sd和fip.bin替换掉原本的uboot，插卡启动即可。(您也可直接拉源码编译不用替换uboot了，uboot现已修复，虽然还有小问题😅)

## 在进入系统后，如没有网络，你需要修改文件network-init.sh
### 1. 执行vi /etc/network-init.sh

    将文件内部以192.168开头的两个地址进行修改，以下为具体修改过程:
```
    ifconfig eth0 192.168.1.129 up # 修改为自己的开发板网口ip地址
    route add default gw 192.168.1.1 # 修改为开发板网线链接的路由器或者网关的lan口ip地址
```
### 2. 或者执行以下命令:
```
    sed -i 's/192.168.1.129/你想给开发板设置的ip地址/g' /etc/network-init.sh
    sed -i 's/192.168.1.1/你的路由器ip地址/g' /etc/network-init.sh
```

然后,执行chmod +x network-init.sh && ./network-init.sh

一般会成功启动网络，你可以试试ping一下百度或者github等网站，一般能ping通就可以使用网络了。后续也可以使用ssh远程链接duo.

### 你也可以直接运行root目录下的脚本初始化网络

If you are not within China, you can use official-image-site:
```
sed -i 's/mirrors.tuna.tsinghua.edu.cn/dl-cdn.alpinelinux.org/g' /etc/apk/repositories
```
luci可用,请您手动安装.
```
opkg install luci
```

参考文献:https://blog.csdn.net/qq_39858654/article/details/135777769?spm=1001.2014.3001.5501
