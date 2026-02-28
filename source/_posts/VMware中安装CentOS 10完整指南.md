title: VMware中安装CentOS 10完整指南

tags:

- CentOS 10
- 虚拟机
- 新手入门

categories:

- 技术教程

date: 2026-02-28 11:30:00

---

你是否在VMware中安装CentOS 10后，发现无法上网？是否还在按照老方法修改`ifcfg-ens33`却发现根本没有这个文件？今天，我就带你一步步完成CentOS 10的完整安装，并重点解决这个典型的网络问题。

<!--more-->

最近在VMware中安装CentOS 10时遇到了典型的网络问题：系统安装完成后无法上网。通过一步步排查最终解决，现将完整的安装和配置过程记录下来，希望能帮助遇到同样困扰的朋友。CentOS 10的网络管理方式相比老版本有了较大变化，如果你还在用传统方法配置网络，一定会踩坑！

------

## 什么是CentOS？为什么要用虚拟机安装？

### CentOS是什么？

**CentOS**（Community Enterprise Operating System）是Linux发行版之一，它基于Red Hat Enterprise Linux（RHEL）的源代码编译而成，完全免费且企业级稳定。简单来说，CentOS就是**免费的企业级Linux系统**。

### CentOS的典型应用场景

- **服务器操作系统**：绝大多数网站、应用的后台服务器运行CentOS
- **学习Linux**：如果你想学习Linux运维，CentOS是最佳选择之一
- **开发环境**：很多企业开发环境基于CentOS，本地搭建一致环境避免"水土不服"
- **容器基础镜像**：Docker等容器技术常用CentOS作为基础镜像

### 为什么用虚拟机安装？

通过虚拟机安装CentOS，你可以：

- **零风险学习**：即使系统崩溃，也不会影响宿主机
- **随时还原**：通过快照功能，可以随时回退到某个状态
- **模拟服务器环境**：真实体验服务器运维的工作方式
- **一台电脑多系统**：同时拥有Windows和Linux，互不干扰

------

## 准备工作

### 下载所需文件

**VMware Workstation**

- 访问VMware官网下载Workstation Pro
- 个人使用可以选择免费试用版

下载详情见[打造属于你的云端实验室：VMware虚拟机与FinalShell完美组合实战指南](https://zgj6017.github.io/2026/02/28/%E6%89%93%E9%80%A0%E5%B1%9E%E4%BA%8E%E4%BD%A0%E7%9A%84%E4%BA%91%E7%AB%AF%E5%AE%9E%E9%AA%8C%E5%AE%A4%EF%BC%9AVMware%E8%99%9A%E6%8B%9F%E6%9C%BA%E4%B8%8EFinalShell%E5%AE%8C%E7%BE%8E%E7%BB%84%E5%90%88%E5%AE%9E%E6%88%98%E6%8C%87%E5%8D%97/)

**CentOS 10 ISO镜像**

- 访问[CentOS](https://www.centos.org/download/)官网下载
- 选择DVD ISO（约8-10GB）或Minimal ISO（约2GB）
- 建议下载DVD ISO，包含常用软件包
- {% asset_img image-20260228120051316.png 这是一个图片说明%}

### 检查宿主机环境

- **硬盘空间**：至少20GB可用空间
- **内存**：建议8GB以上（给虚拟机分配2-4GB）
- **CPU**：支持虚拟化技术（BIOS中需开启VT-x/AMD-V）

------

## VMware虚拟机创建

### 新建虚拟机

1. **打开VMware**，点击"创建新的虚拟机"或选择"文件 → 新建虚拟机"
2. **选择配置类型**
   - 选择"典型(推荐)" → 下一步
3. **安装来源选择**
   - 选择"安装程序光盘映像文件(iso)"
   - 浏览选择已下载的CentOS 10 ISO文件
   - → 下一步
4. **客户机操作系统选择**
   - 客户机操作系统：选择"Linux"
   - 版本：选择"CentOS 10"（如果没有exact版本，选择接近的如"CentOS 9"或"Red Hat Enterprise Linux 10"）
   - → 下一步
5. **命名虚拟机**
   - 虚拟机名称：输入"CentOS 10"（或你喜欢的名字）
   - 位置：选择安装位置（建议有足够空间，至少20GB）
   - → 下一步
6. **指定磁盘容量**
   - 最大磁盘大小：建议20GB以上
   - 选择"将虚拟磁盘存储为单个文件"（性能较好）
   - → 下一步
7. **自定义硬件（关键步骤！）**
   - 点击"自定义硬件"
   - **内存**：建议2GB以上（根据宿主机配置调整）
   - **处理器**：至少1核，建议2核
   - **新CD/DVD**：确认已连接ISO文件
   - **网络适配器**：**务必选择"NAT模式"**（这是后续联网的关键）
   - **USB控制器、声卡、打印机**：可以移除（不需要可去掉，减少资源占用）
   - 点击"关闭" → 完成

### 虚拟机创建后的优化建议

在启动前，对虚拟机进行一些优化：

| 配置项     | 建议    | 说明                 |
| :--------- | :------ | :------------------- |
| CPU        | 2核     | 提升编译和运行速度   |
| 内存       | 4GB     | 保证系统流畅运行     |
| 网络适配器 | NAT模式 | 确保能通过宿主机上网 |
| 无用硬件   | 移除    | 减少资源占用         |

------

## CentOS 10系统安装

### 启动安装程序

1. 点击"开启此虚拟机"
2. 等待系统启动，出现安装菜单
3. 选择"Install CentOS 10"（第一项），按回车

### 安装语言选择

- 建议选择**英文**（English），避免后续命令行出现中文乱码
- 点击"Continue"

### 关键安装配置

#### 安装目的地（磁盘分区）

- 点击"Installation Destination"
- 选择创建的虚拟磁盘（默认已选中）
- 选择"Automatically configure partitioning"（自动分区）
- 点击"Done"

#### 网络与主机名（非常重要！）

- 点击"Network & Host Name"
- 应该能看到网卡（如ens33）
- **确保开关保持ON状态**（安装时网卡必须开启）
- 可以修改主机名（如`centos10.local`）
- 点击"Apply" → "Done"

#### 根密码与用户创建

- **Root Password**：设置root密码（务必记住！）
- **User Creation**：创建普通用户
  - 用户名：如`centos`（或你喜欢的名字）
  - 勾选"Make this user administrator"（赋予sudo权限）
  - 设置密码

#### 软件选择（可选但推荐）

- 点击"Software Selection"
- 建议勾选"Development Tools"（开发工具），方便后续编译安装软件
- 也可以根据需要选择"Server with GUI"（带图形界面）或最小化安装
- 点击"Done"

### 开始安装

1. 确认所有配置无误后，点击"Begin Installation"
2. 等待安装完成（约5-10分钟，取决于硬件性能）
3. 安装完成后点击"Reboot System"

------

## 首次启动与网络问题发现

### 首次登录

1. 系统重启后，看到登录界面
2. 使用之前创建的普通用户登录
3. 打开终端（Terminal）

### 验证网络状态——发现问题

登录后，立即查看网络状态：

```
ip addr show
```



**典型的问题现象**（我遇到的情况）：

```
ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 ...
    inet6 fe80::20c:29ff:feed:4bbc/64 scope link 
    # ⚠️ 注意：只有IPv6地址，没有IPv4地址！
```



尝试ping外网验证：

```
ping www.baidu.com
# 失败：ping: www.baidu.com: 域名解析暂时失败
```



**问题确认**：虚拟机无法上网，没有获取到IPv4地址。

------

## 网络配置问题深度排查与解决

### 第一反应：检查传统配置文件（会踩坑！）

按照以往CentOS的经验，很多朋友第一反应是修改网卡配置文件：

```
# ⚠️ 这个方法在CentOS 10中行不通！
sudo vi /etc/sysconfig/network-scripts/ifcfg-ens33
# 返回错误：没有那个文件或目录
```



如果尝试用sed批量修改：

```
sudo sed -i 's/^ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/ifcfg-*
# 错误：sed：无法读取 /etc/sysconfig/network-scripts/ifcfg-*：没有那个文件或目录
```



### 为什么传统方法失效了？

**原因分析**：CentOS 10已经弃用了传统的`ifcfg-*`网络配置文件，改用**NetworkManager全面管理网络**，配置文件存储在`/etc/NetworkManager/system-connections/`目录下，使用keyfile格式。

这正是很多新手（甚至老手）踩坑的地方！CentOS网络管理方式已经发生了根本性变化：

| CentOS版本 | 网络管理方式             | 配置文件位置                              | 特点               |
| :--------- | :----------------------- | :---------------------------------------- | :----------------- |
| CentOS 6   | network service          | `/etc/sysconfig/network-scripts/ifcfg-*`  | 传统init脚本管理   |
| CentOS 7/8 | NetworkManager + network | 两者共存                                  | 过渡期，兼容旧配置 |
| CentOS 9   | NetworkManager only      | `/etc/NetworkManager/system-connections/` | 全面接管网络       |
| CentOS 10  | NetworkManager only      | `/etc/NetworkManager/system-connections/` | keyfile格式        |

### 正确排查方法

首先，查看当前网络连接状态：

```
nmcli con show
```



输出示例：

```
NAME   UUID                                  TYPE      DEVICE 
ens33  12682173-76f8-3b31-b3e3-101e47012d73  ethernet  ens33  
lo     705d26fd-5635-42fc-a2a9-47387ef01598  loopback  lo
```



### 解决方案一：使用nmcli命令行配置（推荐）

**nmcli**是NetworkManager的命令行工具，功能强大，适合远程操作和脚本编写：

```
# 1. 查看当前连接（确认网卡名称）
nmcli con show

# 2. 设置开机自动连接
sudo nmcli con mod ens33 connection.autoconnect yes

# 3. 设置自动获取IP（DHCP）
sudo nmcli con mod ens33 ipv4.method auto

# 4. 重新激活连接
sudo nmcli con up ens33
```



### 解决方案二：使用nmtui图形化界面（新手友好）

对于不熟悉命令行的朋友，可以使用文本界面工具**nmtui**：

```
# 启动文本界面配置工具
sudo nmtui
```



在界面中操作：

1. 选择 **"Edit a connection"** → 回车
2. 选择网卡 **"ens33"** → 选择 **"Edit"** → 回车
3. 确保以下设置正确：
   - **IPv4 CONFIGURATION** = **"Automatic"**
   - **Automatically connect** = **"[X]"**（已勾选）
4. 选择 **"OK"** 保存
5. 选择 **"Back"** 返回主菜单 → **"Quit"** 退出

### 激活连接时可能遇到的错误

执行`nmcli con up ens33`时可能遇到：

```
错误：连接激活失败：IP 配置无法保留（无可用地址、超时等）
```



这是另一个常见问题，通常与VMware服务或虚拟网络配置有关。

#### 检查宿主机VMware服务

在Windows宿主机中：

1. 按`Win + R`输入`services.msc`回车
2. 找到以下两个服务：
   - **VMware NAT Service**
   - **VMware DHCP Service**
3. 确保状态为"正在运行"
4. 双击服务，将"启动类型"设为"自动"
5. 如果服务未运行，右键点击启动

#### 检查VMware虚拟网络配置

1. **关闭CentOS虚拟机**
2. VMware菜单 → **编辑** → **虚拟网络编辑器**
3. 点击左下角 **"更改设置"**（需要管理员权限）
4. 选择 **VMnet8**（NAT模式）
5. 确认配置：
   - 子网IP：通常是192.168.x.0
   - 子网掩码：255.255.255.0
   - **勾选"使用本地DHCP服务将IP地址分配给虚拟机"**
6. 点击 **"NAT设置"**，确认网关IP（通常是192.168.x.2）
7. 如果配置混乱，可以点击 **"还原默认设置"** 重置

#### 手动触发DHCP请求

在CentOS终端中：

```
# 断开网卡连接
sudo nmcli device disconnect ens33

# 重新连接，触发DHCP请求
sudo nmcli device connect ens33

# 或者使用dhclient手动获取IP
sudo dhclient -v ens33
```



------

## 验证网络配置成功

### 检查IP地址获取情况

```
ip addr show ens33
```



**成功输出**（包含IPv4地址）：

```
ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> ...
    inet 192.168.40.128/24 brd 192.168.40.255 scope global dynamic ens33
    inet6 fe80::20c:29ff:feed:4bbc/64 scope link 
```



关键信息解读：

- `inet 192.168.40.128/24` - 成功获取到IPv4地址
- `dynamic` - 通过DHCP自动获取
- `valid_lft 1786sec` - 租约有效期（会自动续约）

### 测试网络连通性

```
# 测试网关连通性
ping -c 2 192.168.40.2  # 网关地址根据实际修改

# 测试外网连通性
ping -c 4 www.baidu.com
```



**成功响应示例**：

```
PING www.a.shifen.com (14.119.104.254) 56(84) bytes of data.
64 bytes from 14.119.104.254: icmp_seq=1 ttl=128 time=30.1 ms
64 bytes from 14.119.104.254: icmp_seq=2 ttl=128 time=29.8 ms
```



### 验证DNS解析

```
# 测试域名解析
nslookup www.baidu.com
# 或
dig www.baidu.com

# 查看DNS配置
cat /etc/resolv.conf
```



### 查看路由信息

```
ip route show
```



期望输出：

```
default via 192.168.40.2 dev ens33 proto dhcp src 192.168.40.128 metric 100
192.168.40.0/24 dev ens33 proto kernel scope link src 192.168.40.128 metric 100
```



------

## 深入理解CentOS 10网络管理

### 为什么CentOS要改用NetworkManager？

NetworkManager是现代Linux系统的标准网络管理工具，它：

- **自动感知网络变化**：插拔网线、切换WiFi自动响应
- **统一管理多种连接**：有线、无线、VPN、移动宽带
- **支持多种配置源**：DHCP、手动配置、VPN配置
- **提供统一接口**：命令行（nmcli）、图形界面（nmtui）、GUI小程序

### VMware网络模式详解

**NAT模式（推荐）**：

- 虚拟机通过宿主机共享上网
- 虚拟机组成本地子网（如192.168.40.0/24）
- 宿主机作为网关和DHCP服务器
- 适合大多数学习测试场景

**桥接模式**：

- 虚拟机直接连接物理网络
- 获取局域网真实IP
- 需要局域网有可用IP地址
- 适合需要对外提供服务的场景

**仅主机模式**：

- 只能与宿主机通信
- 无法访问外网
- 用于完全隔离的测试环境

### DHCP工作原理

DHCP（动态主机配置协议）自动分配IP地址的过程：

1. **DHCP Discover**：客户端广播寻找DHCP服务器
2. **DHCP Offer**：服务器响应提供IP地址
3. **DHCP Request**：客户端请求使用该IP
4. **DHCP ACK**：服务器确认分配

------

## 常用网络管理命令速查表

### nmcli命令大全

```
# 查看所有连接
nmcli con show

# 查看所有设备状态
nmcli device status

# 查看特定连接详情
nmcli con show ens33

# 修改连接参数
sudo nmcli con mod ens33 connection.autoconnect yes
sudo nmcli con mod ens33 ipv4.method auto
sudo nmcli con mod ens33 ipv4.addresses 192.168.40.100/24  # 设置静态IP
sudo nmcli con mod ens33 ipv4.gateway 192.168.40.2
sudo nmcli con mod ens33 ipv4.dns "8.8.8.8 114.114.114.114"

# 激活/停用连接
sudo nmcli con up ens33
sudo nmcli con down ens33

# 重新加载配置
sudo nmcli con reload

# 删除连接
sudo nmcli con delete ens33
```



### 设备管理命令

```
# 查看设备状态
nmcli dev status

# 连接/断开设备
sudo nmcli dev connect ens33
sudo nmcli dev disconnect ens33

# 查看设备详情
nmcli dev show ens33
```



### 网络故障排查工具

```
# 查看网络服务日志
sudo journalctl -u NetworkManager -f

# 实时监控网络事件
sudo journalctl -xe -u NetworkManager

# 测试端口连通性
telnet 8.8.8.8 53
nc -zv 8.8.8.8 53

# 跟踪路由路径
traceroute www.baidu.com

# 查看网络统计
netstat -i
ss -tunap
```



------

## 常见问题及解决方案

### 网络配置问题

**Q1: 虚拟机无法获取IP地址**

- 检查VMware NAT/DHCP服务是否运行
- 检查虚拟网络编辑器中DHCP是否启用
- 尝试手动触发：`sudo dhclient -v ens33`

**Q2: 能ping通IP但ping不通域名**

- DNS配置问题
- 检查：`cat /etc/resolv.conf`
- 添加DNS：`sudo nmcli con mod ens33 ipv4.dns "8.8.8.8"`

**Q3: 重启后网络配置丢失**

- 检查autoconnect设置：`nmcli con show ens33 | grep autoconnect`
- 重新设置：`sudo nmcli con mod ens33 connection.autoconnect yes`

**Q4: 网卡名称不是ens33**

- 使用实际名称替换命令中的ens33
- 查看实际名称：`nmcli con show` 或 `ip addr`

### 系统配置问题

**Q5: sudo命令提示用户不在sudoers中**

- 切换到root：`su -`
- 添加用户：`usermod -aG wheel 用户名`
- 或编辑：`visudo` 添加 `用户名 ALL=(ALL) ALL`

**Q6: 安装时没创建普通用户**

- 创建用户：`useradd -m 用户名`
- 设置密码：`passwd 用户名`
- 添加sudo权限：`usermod -aG wheel 用户名`

------

## 优化与个性化配置

### 设置静态IP（可选）

如果需要固定IP地址（如搭建服务器）：

```
# 1. 查看当前网络信息
ip route show

# 2. 修改为静态IP
sudo nmcli con mod ens33 ipv4.method manual
sudo nmcli con mod ens33 ipv4.addresses 192.168.40.200/24
sudo nmcli con mod ens33 ipv4.gateway 192.168.40.2
sudo nmcli con mod ens33 ipv4.dns "8.8.8.8 114.114.114.114"

# 3. 重新激活
sudo nmcli con up ens33
```



### 配置主机名

```
# 查看当前主机名
hostnamectl

# 设置主机名
sudo hostnamectl set-hostname centos10.local

# 修改hosts文件
sudo vi /etc/hosts
# 添加：192.168.40.128 centos10.local
```



### 安装常用工具

```
# 更新系统
sudo dnf update -y

# 安装常用工具
sudo dnf install -y vim wget curl net-tools telnet
sudo dnf install -y bash-completion  # 命令行补全
sudo dnf install -y epel-release     # 额外软件源

# 开发工具（如果需要）
sudo dnf groupinstall -y "Development Tools"
```



### SSH服务配置（远程访问）

```
# 安装SSH服务
sudo dnf install -y openssh-server

# 启动SSH服务
sudo systemctl start sshd
sudo systemctl enable sshd

# 查看IP
ip addr show ens33
# 在宿主机上通过SSH连接：ssh 用户名@192.168.40.128
```



------

## 备份与恢复技巧

### 虚拟机快照（强烈推荐）

配置好网络后，建议创建快照：

1. 关闭虚拟机或关机
2. VMware菜单 → **虚拟机** → **快照** → **拍摄快照**
3. 命名如"Network_Configured"
4. 描述："网络已配置好，可正常上网"

这样，无论以后怎么折腾系统，都可以一键恢复到网络正常的状态。

### 网络配置备份

```
# 备份NetworkManager连接配置
sudo cp -r /etc/NetworkManager/system-connections/ ~/network-backup/

# 导出特定连接配置
sudo nmcli con export ens33 > ~/ens33-backup.nmconnection

# 恢复配置
sudo nmcli con import type ethernet file ~/ens33-backup.nmconnection
```



------

通过本文的完整流程，你应该能够：

✅ 理解CentOS是什么及虚拟机的价值
✅ 成功在VMware中创建CentOS 10虚拟机
✅ 顺利完成CentOS 10系统安装
✅ 理解CentOS网络管理的变迁（为什么传统方法失效）
✅ 掌握nmcli和nmtui配置网络的方法
✅ 解决常见的网络故障（VMware服务问题、DHCP问题等）
✅ 了解网络配置的原理和技巧
✅ 学会备份和快照，防止问题重现

CentOS 10的网络配置方式相比老版本有了较大变化，但掌握了`nmcli`和`nmtui`的使用方法后，配置起来反而更加简单直观。更重要的是，这些工具也是真实服务器运维中的标准配置——提前掌握这些技能，对你未来的工作和学习都大有裨益。