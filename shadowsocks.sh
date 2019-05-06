#!/bin/sh
read -p "密码设置 [默认:aimo]: " passwd
if [ -z $passwd ]; then
	passwd="aimo"
	echo "您使用了默认密码: "$passwd
fi
read -p "端口设置 [默认:18556]: " port
if echo $port | grep -q '[^0-9]'; then
	port=18556
    echo "端口设置错误 > 您将使用了默认端口号码："$port
fi
if [ !$port || $port < 0 || $port> 65535]; then
	port=18556
	echo "您将使用了默认端口号码: "$port
fi
wget -O shadowsocks2-linux https://github.com/iphuket/ss/releases/download/v1.0/shadowsocks2-linux
chmod +x ./shadowsocks2-linux
nohup ./shadowsocks2-linux -s 'ss://aes-256-cfb:'$passwd'@:'$port -verbose > shadowsocks2-linux.log 2>&1 & 

echo "如无法正常使用,请查看日志 ./shadowsocks2-linux.log"
echo "注意防火墙开放相应端口"
echo "加密：aes-256-cfb"
echo "密码: "$passwd
echo "端口: "$port
