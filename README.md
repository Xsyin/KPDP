# KPDP: Kernel Permission Data Protection Against Data-oriented Attacks

> 系统开发环境为 x86 笔记本， Ubuntu 20.04 Linux 5.4.155内核

## 1. 源码
1）下载原始内核代码，[地址](https://ftp.sjtu.edu.cn/sites/ftp.kernel.org/pub/linux/kernel/v5.x/linux-5.4.155.tar.gz).
2) 生成host即宿主机代码，打host.patch
```
# patch 生成命令: diff -uprN linux-5.4.155 linux-5.4.155_host > host.patch (linux-5.4.155_host目录为宿主机代码目录)
# 打patch
cd linux-5.4.155
patch -p1 < host.patch
cd ..
mv linux-5.4.155 linux-5.4.155_host

```
3) 生成虚拟机内客户机系统源码，打qemu.patch，与步骤2类似。
```
# patch 生成命令: diff -uprN linux-5.4.155 linux-5.4.155_qemu > host.patch (linux-5.4.155_qemu目录为客户机代码目录)
# 打patch
cd linux-5.4.155  （linux-5.4.155为步骤1中的原始代码）
patch -p1 < qemu.patch
cd ..
mv linux-5.4.155 linux-5.4.155_qemu

```
4) linux-5.4.155_host 和 linux-5.4.155_qemu目录 arch/x86/configs/下的x86_64_defconfig复制当前系统boot目录下的config文件替换

## 2.编译
1）两目录下分别make 编译

## 3. 运行
1）两目录下分别运行grub-img目录下的generate.sh生成相应版本的内核模块和内核，分别放入当前系统和虚拟机的/usr/lib/modules和boot目录下，启动时选择linux-5.4.155内核

2) 虚拟机的创建: qemu目录下
```
# 启动 ubuntu 18.04 的虚拟机
./start.sh

# 若创建新的虚拟机系统，修改mkimg.sh和start.sh
```
3） 至此KPDP部署完毕, host内可以保护虚拟机内系统的关键数据不被篡改。
