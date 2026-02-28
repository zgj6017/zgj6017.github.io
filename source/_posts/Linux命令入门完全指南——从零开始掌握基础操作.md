title: Linux命令入门完全指南——从零开始掌握基础操作

tags:

- Linux
- 文件操作
- 入门教程

categories:

- 技术教程

date: 2026-02-28 16:44:00

---

Linux系统之所以强大，很大程度上归功于其丰富的命令行工具。对于初学者来说，面对黑底白字的终端可能会感到有些畏惧，但请放心，只要掌握了最基础的几十个命令，你就能轻松驾驭Linux系统。本文将带你从零开始，系统学习Linux命令的入门知识，所有命令均在CentOS环境下验证通过。

<!--more-->

后面有实战案例

## 一、目录切换相关命令（cd/pwd）

在Linux系统中，我们大部分时间都在文件和目录之间穿梭。掌握目录切换是使用命令行的第一步。

### 1. pwd——显示当前目录

`pwd`是"Print Working Directory"的缩写，用于显示当前所在的目录路径。

```
$ pwd
/home/username
```



每当你迷失在层层目录中时，输入`pwd`就能立刻知道自己身在何处。

### 2. cd——切换目录

`cd`是"Change Directory"的缩写，用于在不同目录之间切换。

**基本用法：**

```
cd [目录名]
```



**常用示例：**

```
cd /home/user          # 切换到指定绝对路径
cd Documents           # 切换到当前目录下的Documents子目录
cd ..                  # 返回上一级目录
cd ../..               # 返回上两级目录
cd ~                   # 返回当前用户的主目录
cd -                   # 返回上一次所在的目录
```



------

## 二、相对路径、绝对路径和特殊路径符

理解路径的概念是使用Linux命令的基础。

### 1. 绝对路径

从根目录（/）开始的完整路径称为绝对路径。它以斜杠（/）开头，能够唯一确定文件或目录的位置。

```
cd /home/username/Documents/project
```



无论当前在哪个目录，使用绝对路径都能准确定位到目标位置。

### 2. 相对路径

相对于当前工作目录的路径称为相对路径。它不以斜杠开头，而是从当前位置开始计算。

假设当前在`/home/username`目录下：

```
cd Documents           # 相对路径，相当于cd /home/username/Documents
cd ../otheruser        # 相对路径，先返回上一级再进入otheruser
```



### 3. 特殊路径符

- `.`——代表当前目录

  ```
  cd ./Documents       # 等同于cd Documents
  ```

  

- `..`——代表上一级目录

  ```
  cd ..                # 返回上一级
  ```

  

- `~`——代表当前用户的主目录

  ```
  cd ~                 # 快速回到home目录
  cd ~/Downloads       # 进入home目录下的Downloads文件夹
  ```

  

- `-`——代表上一次所在的目录

  ```
  cd -                 # 在两个目录间快速切换
  ```

  

------

## 三、创建目录命令（mkdir）

`mkdir`是"Make Directory"的缩写，用于创建新的目录。

### 基本用法

```
mkdir [目录名]
```



### 常用示例

```
mkdir myfolder                # 在当前目录下创建名为myfolder的目录
mkdir /tmp/testdir            # 在/tmp目录下创建testdir
```



### 常用参数

- `-p`：递归创建多级目录

  ```
  mkdir -p parent/child/grandchild  # 一次性创建多级嵌套目录
  ```

  

- `-m`：设置目录权限

  ```
  mkdir -m 755 myfolder        # 创建目录并设置权限为755
  ```

  

### 注意事项

- 如果目录已存在，mkdir会报错
- 创建目录需要对父目录有写权限

------

## 四、文件操作命令part1（touch、cat、more）

### 1. touch——创建空文件或更新时间戳

`touch`命令的主要作用是创建一个空文件，或者更新已有文件的访问和修改时间。

#### 创建空文件

```
touch newfile.txt              # 创建一个名为newfile.txt的空文件
touch file1.txt file2.txt      # 同时创建多个文件
```



#### 更新时间戳

如果文件已存在，touch会将其访问和修改时间更新为当前时间：

```
touch existingfile.txt         # 更新文件的最后修改时间
```



### 2. cat——查看文件内容

`cat`是"Concatenate"的缩写，主要用于查看小文件的内容，也可以合并多个文件。

#### 查看文件内容

```
cat filename.txt               # 显示文件内容到屏幕
```



#### 合并文件

```
cat file1.txt file2.txt > merged.txt  # 合并file1和file2到merged
```



#### 常用参数

- `-n`：显示行号

  ```
  cat -n filename.txt          # 显示内容并加上行号
  ```

  

### 3. more——分页查看文件内容

当文件内容较长，一屏显示不下时，可以使用`more`命令分页查看。

#### 基本用法

```
more longfile.txt              # 分页显示文件内容
```



#### 操作方式

- 按**空格键**：显示下一页
- 按**回车键**：显示下一行
- 按**q键**：退出查看
- 按**b键**：返回上一页

#### 实际示例

```
more /etc/passwd               # 分页查看用户账户文件
```



------

## 五、文件操作命令part2（cp、mv、rm）

### 1. cp——复制文件或目录

`cp`是"Copy"的缩写，用于复制文件或目录。

#### 复制文件

```
cp source.txt destination.txt   # 将source.txt复制为destination.txt
cp file.txt /tmp/               # 将文件复制到/tmp目录下（保持原名）
```



#### 复制目录（需要-r参数）

```
cp -r sourcedir destdir        # 递归复制整个目录
```



#### 常用参数

- `-r`或`-R`：递归复制目录及其内容

- `-i`：交互式操作，覆盖前提示

  ```
  cp -i file.txt /tmp/         # 如果目标存在，会询问是否覆盖
  ```

  

- `-p`：保留文件属性（权限、时间戳等）

- `-v`：显示详细操作过程

### 2. mv——移动或重命名文件

`mv`是"Move"的缩写，用于移动文件或目录，也可用于重命名。

#### 重命名文件（在同一目录内移动）

```
mv oldname.txt newname.txt     # 将文件重命名
```



#### 移动文件到其他目录

```
mv file.txt /tmp/              # 将文件移动到/tmp目录
mv myfolder /backup/           # 将目录移动到/backup下
```



#### 移动并重命名

```
mv /home/user/file.txt /tmp/newfile.txt  # 移动并同时重命名
```



#### 常用参数

- `-i`：交互式操作，覆盖前提示
- `-v`：显示详细操作过程
- `-u`：只在源文件比目标文件新时才移动

### 3. rm——删除文件或目录

`rm`是"Remove"的缩写，用于删除文件或目录。

#### 删除文件

```
rm file.txt                    # 删除单个文件
rm file1.txt file2.txt         # 同时删除多个文件
```



#### 删除目录（需要-r参数）

```
rm -r myfolder                 # 递归删除目录及其内容
```



#### 常用参数

- `-r`或`-R`：递归删除目录及其内容

- `-f`：强制删除，不提示确认

  ```
  rm -f file.txt               # 强制删除，即使文件是只读的
  ```

  

- `-i`：删除前逐一询问确认

#### ⚠️ 特别警告

```
rm -rf /                       # 这是最危险的命令！会删除整个系统
rm -rf *                       # 删除当前目录下的所有内容
```



**重要提示**：使用rm命令要格外小心，尤其是配合`-rf`参数时。删除的文件通常无法恢复！

------

## 六、查找命令（which、find）

### 1. which——查找命令的路径

`which`命令用于查找某个可执行程序在系统中的位置。

#### 基本用法

```
which ls                       # 查找ls命令的位置，通常输出/bin/ls
which python                   # 查找python解释器的位置（CentOS 7默认无python3需安装）
which -a python                # 显示所有匹配的路径，而不仅是第一个
```



#### 实际应用

当你安装了多个版本的软件，想确认当前使用的是哪个版本时：

```
which python3                  # /usr/bin/python3（如果已安装）
which pip                      # /usr/bin/pip
```



### 2. find——强大的文件搜索工具

`find`命令可以在指定目录下查找文件，支持按文件名、类型、大小、时间等多种条件搜索。

#### 按文件名查找

```
find /home -name "file.txt"    # 在/home目录下查找名为file.txt的文件
find . -name "*.txt"           # 在当前目录下查找所有txt文件
find / -name "*.conf"          # 在整个系统中查找所有conf文件
```



#### 常用查找条件

```
# 按文件类型查找
find / -type f                 # 查找所有普通文件
find / -type d                 # 查找所有目录
find / -type l                 # 查找所有符号链接

# 按文件大小查找
find . -size +10M              # 查找大于10MB的文件
find . -size -1k               # 查找小于1KB的文件

# 按时间查找
find . -mtime -7               # 查找7天内修改过的文件
find . -mtime +30              # 查找30天前修改过的文件

# 组合条件
find . -name "*.log" -size +100M  # 查找大于100MB的log文件
```



#### 对查找结果执行操作

```
find . -name "*.tmp" -delete   # 查找并删除所有tmp文件
find . -name "*.sh" -exec chmod +x {} \;  # 给所有sh文件添加执行权限
```



------

## 七、grep、wc和管道符

### 1. grep——强大的文本搜索工具

`grep`用于在文件中搜索匹配指定模式的行，是最常用的文本处理命令之一。

#### 基本用法

```
grep "pattern" filename        # 在文件中搜索包含pattern的行
```



#### 常用示例

```
grep "error" log.txt           # 在log.txt中查找包含error的行
grep "127.0.0.1" /etc/hosts    # 在hosts文件中查找指定IP

# 常用参数
grep -i "warning" log.txt      # 忽略大小写搜索
grep -r "TODO" /home/project   # 递归搜索目录下所有文件
grep -n "function" script.py   # 显示匹配行的行号
grep -v "debug" log.txt        # 显示不包含debug的行（反向匹配）
grep -c "failed" log.txt       # 统计匹配的行数
```



#### 结合正则表达式

```
grep "^[A-Z].*" file.txt       # 查找以大写字母开头的行
grep "[0-9]\{4\}" file.txt     # 查找包含4位数字的行（CentOS grep默认基础正则）
```



### 2. wc——统计行数、单词数和字符数

`wc`是"Word Count"的缩写，用于统计文件中的行数、单词数和字符数。

#### 基本用法

```
wc filename.txt                # 显示行数、单词数、字符数
```



#### 常用参数

```
wc -l file.txt                 # 只统计行数
wc -w file.txt                 # 只统计单词数
wc -c file.txt                 # 只统计字符数（字节数）
```



#### 实际应用

```
wc -l /etc/passwd              # 统计系统有多少个用户（一行一个）
ls -l | wc -l                  # 统计当前目录下的文件数量
grep "error" log.txt | wc -l   # 统计日志中错误出现的次数
```



### 3. 管道符（|）——命令的组合利器

管道符`|`用于将一个命令的输出作为另一个命令的输入，实现命令的组合。

#### 基本概念

```
command1 | command2            # 将command1的输出传给command2
```



#### 实际应用

```
# 分页查看大量输出
ls -la /etc | more             # 将ls的输出传给more分页显示

# 筛选特定信息
ps aux | grep python           # 查看所有python进程
history | grep "yum"           # 查找历史命令中与yum相关的

# 统计计数
ls | wc -l                     # 统计当前目录下的文件数
cat log.txt | grep "ERROR" | wc -l  # 统计日志中ERROR出现的次数

# 多重管道
cat /var/log/messages | grep "error" | tail -n 10  # 查看最后10条错误日志（CentOS日志文件）
```



#### 管道符的优势

- 组合简单命令完成复杂任务
- 避免创建大量临时文件
- 提高工作效率

------

## 八、echo、tail和重定向符

### 1. echo——输出文本

`echo`命令用于在终端输出文本或变量的值。

#### 基本用法

```
echo "Hello World"             # 输出Hello World
echo Hello World               # 引号可以省略，但建议保留以避免歧义
```



#### 输出变量

```
echo $PATH                     # 输出PATH环境变量的值
echo $HOME                     # 输出当前用户的家目录
name="John"
echo "My name is $name"        # 输出My name is John
```



#### 常用参数

```
echo -n "No newline"           # 输出后不换行
echo -e "Line1\nLine2"         # 启用转义字符（\n换行）
```



### 2. tail——查看文件末尾

`tail`命令用于查看文件的末尾部分，特别适合查看最新的日志。

#### 基本用法

```
tail filename.txt              # 显示文件最后10行
```



#### 常用参数

```
tail -n 20 filename.txt        # 显示最后20行
tail -f /var/log/messages      # 实时追踪系统日志（按Ctrl+C退出）
tail -f -n 50 app.log          # 从最后50行开始实时追踪日志
```



#### 实际应用

```
tail -f /var/log/nginx/access.log  # 实时监控web访问日志
tail -n 100 error.log          # 查看最后100行错误日志
```



### 3. 重定向符（>、>>）

重定向符用于控制命令的输入输出方向，是Linux命令行的重要特性。

#### 输出重定向

**>**（覆盖重定向）：将命令的输出写入文件，如果文件已存在则覆盖

```
echo "Hello" > file.txt        # 将Hello写入file.txt（覆盖原有内容）
ls -la > list.txt              # 将目录列表保存到list.txt
```



**>>**（追加重定向）：将命令的输出追加到文件末尾

```
echo "New line" >> file.txt    # 在file.txt末尾追加一行
date >> log.txt                # 将当前时间追加到日志文件
```



#### 输入重定向

**<**：从文件读取输入

```
wc -l < file.txt               # 从file.txt读取内容并统计行数
```



#### 错误重定向

**2>**：重定向错误输出

```
ls /nonexistent 2> error.log   # 将错误信息保存到error.log
```



#### 组合使用

```
command > output.txt 2>&1      # 将标准输出和错误输出都重定向到同一个文件
```



#### 实际应用示例

```
# 创建配置文件
echo "server {
    listen 80;
    server_name example.com;
}" > nginx.conf

# 记录命令输出
date >> activity.log
echo "Backup completed" >> activity.log

# 保存错误信息
find / -name "*.conf" 2> errors.txt
```



------

## 九、vim编辑器入门

在Linux系统中，vi作为经典的文本编辑器几乎无处不在，而vim（Vi IMproved）则是它的增强版本，提供了更多功能和更好的用户体验。CentOS默认安装了vim-minimal包，你可以通过`yum install vim-enhanced`来安装完整版。下面我们将直接学习vim的使用。

### 1. vim的三种模式

vim编辑器有三种基本模式：

| 模式         | 名称         | 作用                                                |
| :----------- | :----------- | :-------------------------------------------------- |
| **命令模式** | 默认模式     | 进入vim后的初始模式，可以执行复制、粘贴、删除等命令 |
| **插入模式** | 编辑模式     | 可以输入和编辑文本内容                              |
| **末行模式** | 最后一行模式 | 用于保存文件、退出vim、搜索等操作                   |

模式切换：

- 命令模式 → 插入模式：按 `i`
- 插入模式 → 命令模式：按 `Esc`
- 命令模式 → 末行模式：按 `:`

### 2. 打开和退出文件

#### 打开文件

```
vim filename.txt                # 打开或创建文件
vim +10 filename.txt            # 打开文件并定位到第10行
vim +/pattern filename.txt      # 打开文件并定位到第一个匹配pattern的行
```



#### 保存和退出（在末行模式）

```
:w                            # 保存文件
:q                            # 退出vim（如果文件未修改）
:q!                           # 强制退出，不保存修改
:wq                           # 保存并退出
:x                            # 保存并退出（与:wq类似）
```



### 3. 插入模式（编辑文本）

从命令模式进入插入模式的常用命令：

| 命令 | 作用                     |
| :--- | :----------------------- |
| `i`  | 在当前光标位置前插入     |
| `I`  | 在当前行的行首插入       |
| `a`  | 在当前光标位置后插入     |
| `A`  | 在当前行的行尾插入       |
| `o`  | 在当前行下方新建一行插入 |
| `O`  | 在当前行上方新建一行插入 |

### 4. 命令模式下的常用操作

#### 光标移动

```
h, j, k, l                    # 左、下、上、右移动光标
0                             # 移动到行首
$                             # 移动到行尾
gg                            # 移动到文件开头
G                             # 移动到文件末尾
:n                            # 移动到第n行（如:10跳到第10行）
```



#### 文本删除

```
x                             # 删除光标所在字符
dd                            # 删除光标所在行
dw                            # 删除光标所在单词
d$                            # 删除光标到行尾
ndd                           # 删除从当前行开始的n行（如3dd删除3行）
```



#### 复制和粘贴

```
yy                            # 复制光标所在行
yw                            # 复制光标所在单词
p                             # 在光标后粘贴
P                             # 在光标前粘贴
nyy                           # 复制n行（如3yy复制3行）
```



#### 撤销和重做

```
u                             # 撤销上一步操作
Ctrl + r                      # 重做被撤销的操作
```



### 5. 末行模式下的常用命令

#### 搜索和替换

```
/pattern                      # 向下搜索pattern
?pattern                      # 向上搜索pattern
n                             # 重复上一次搜索（相同方向）
N                             # 重复上一次搜索（相反方向）

# 替换（末行模式）
:s/old/new                    # 替换当前行的第一个old为new
:s/old/new/g                  # 替换当前行的所有old为new
:%s/old/new/g                 # 替换整个文件的所有old为new
:%s/old/new/gc                # 替换前逐一确认
```



#### 显示行号

```
:set nu                       # 显示行号
:set nonu                     # 隐藏行号
```



#### 其他实用命令

```
:!command                      # 执行外部命令（如:!ls）
:r file.txt                    # 将file.txt的内容插入到当前位置
```



### 6. vim实用技巧示例

#### 快速编辑配置文件

```
vim /etc/nginx/nginx.conf
# 命令模式下：
/worker_connections           # 搜索配置项
i                             # 进入插入模式修改
Esc                           # 返回命令模式
:wq                           # 保存退出
```



#### 批量操作

```
# 删除包含特定模式的所有行
:g/pattern/d                  # 删除所有包含pattern的行

# 批量注释
Ctrl + v                       # 进入可视块模式
选择多行                       # 移动光标选择
I                              # 在选中区域前插入
#                              # 输入注释符
Esc                            # 应用修改到所有选中行
```



------

## 实战案例：CentOS系统日志分析脚本

下面通过一个完整的实战案例，将本文介绍的所有命令串联起来。我们将创建一个日志分析脚本，用于分析CentOS系统的日志文件。

### 场景描述

作为一名CentOS系统管理员，你需要定期分析`/var/log/messages`系统日志文件，找出错误信息、统计常见错误类型，并生成报告。

### 步骤1：创建工作目录

```
# 显示当前目录
pwd

# 创建项目目录
mkdir -p ~/log-analysis/data
mkdir -p ~/log-analysis/reports
mkdir -p ~/log-analysis/scripts

# 进入项目目录
cd ~/log-analysis
pwd
```



### 步骤2：准备日志样本

```
# 复制系统日志到工作目录（需要root权限）
sudo cp /var/log/messages ./data/
ls -la ./data/

# 查看日志文件信息
wc -l ./data/messages
du -h ./data/messages

# 查看日志开头和结尾
head -n 5 ./data/messages
tail -n 5 ./data/messages
```



### 步骤3：创建分析脚本

```
# 使用vim创建脚本文件
vim ./scripts/analyze-logs.sh
```



在vim中输入以下内容：

```
#!/bin/bash
# CentOS系统日志分析脚本

LOG_FILE="../data/messages"
REPORT_FILE="../reports/report-$(date +%Y%m%d).txt"

echo "========== 日志分析报告 ==========" > $REPORT_FILE
echo "分析时间: $(date)" >> $REPORT_FILE
echo "日志文件: $LOG_FILE" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 统计日志行数
echo "1. 日志总行数: $(wc -l < $LOG_FILE)" >> $REPORT_FILE

# 查找错误信息
echo "" >> $REPORT_FILE
echo "2. 错误信息统计:" >> $REPORT_FILE
echo "----------------" >> $REPORT_FILE
grep -i "error" $LOG_FILE > ../data/errors.tmp
grep -c "error" $LOG_FILE | awk '{print "   错误总数: " $1}' >> $REPORT_FILE

# 统计常见错误类型
echo "" >> $REPORT_FILE
echo "3. 常见错误类型:" >> $REPORT_FILE
grep -i "error" $LOG_FILE | awk '{print $5}' | sort | uniq -c | sort -nr | head -n 5 >> $REPORT_FILE

# 查找关键服务状态
echo "" >> $REPORT_FILE
echo "4. 服务状态信息:" >> $REPORT_FILE
grep -E "systemd|sshd|crond" $LOG_FILE | tail -n 10 >> $REPORT_FILE

# 按小时统计日志量
echo "" >> $REPORT_FILE
echo "5. 日志时间分布(前5小时):" >> $REPORT_FILE
grep "^..." $LOG_FILE | cut -c 1-12 | sort | uniq -c | sort -nr | head -n 5 >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "========== 分析完成 ==========" >> $REPORT_FILE

# 清理临时文件
rm -f ../data/*.tmp

# 显示报告位置
echo "报告已生成: $(pwd)/$REPORT_FILE"
```



保存并退出（在vim中按Esc，然后输入`:wq`）

### 步骤4：添加执行权限并运行

```
# 添加执行权限
chmod +x ./scripts/analyze-logs.sh

# 查看文件权限
ls -l ./scripts/

# 运行脚本
./scripts/analyze-logs.sh

# 查看生成的报告
cat ./reports/report-*.txt
```



### 步骤5：使用管道和重定向优化

```
# 一行命令完成错误统计
cat ./data/messages | grep -i "error" | wc -l

# 找出最常出现的错误信息并保存
grep -i "error" ./data/messages | cut -d' ' -f5- | sort | uniq -c | sort -nr > ./reports/top-errors.txt

# 实时监控日志（新开终端窗口）
sudo tail -f /var/log/messages | grep --line-buffered "error" >> ./data/error-stream.log

# 查找大文件
find ./data -type f -size +1M -exec ls -lh {} \;

# 查找命令位置
which bash
which grep
```



### 步骤6：使用vim编辑配置文件

```
# 创建配置文件
vim ./scripts/config.ini
```



在vim中输入：

```
[settings]
log_file=/var/log/messages
error_patterns=error,failed,denied
report_days=7
output_format=text
```



保存并退出（:wq）

### 步骤7：打包和备份

```
# 打包整个项目
tar -czf log-analysis-backup-$(date +%Y%m%d).tar.gz ~/log-analysis/

# 查看打包文件
ls -lh *.tar.gz

# 移动备份到/tmp
mv *.tar.gz /tmp/

# 验证文件是否存在
find /tmp -name "*.tar.gz" -mtime -1
```



### 步骤8：清理临时文件

```
# 交互式删除旧报告（确认后删除）
rm -i ./reports/*.txt

# 强制删除临时目录
rm -rf ./data/temp/

# 清理超过7天的备份
find /tmp -name "*.tar.gz" -mtime +7 -delete
```



### 实战总结

通过这个实战案例，我们运用了以下所有知识点：

| 命令类别     | 使用场景               |
| :----------- | :--------------------- |
| **cd/pwd**   | 创建和切换工作目录     |
| **mkdir**    | 创建项目目录结构       |
| **cp/mv**    | 复制日志文件、移动备份 |
| **touch**    | 创建配置文件           |
| **cat/more** | 查看日志和报告         |
| **grep**     | 搜索错误信息           |
| **wc**       | 统计行数               |
| **管道符**   | 命令组合处理           |
| **重定向**   | 生成报告文件           |
| **find**     | 查找文件和备份         |
| **which**    | 查找命令路径           |
| **vim**      | 编辑脚本和配置         |
| **tail**     | 实时监控日志           |
| **rm**       | 清理临时文件           |

这个完整的日志分析流程展示了CentOS环境下Linux命令的强大组合能力，通过简单的命令就能完成复杂的系统管理任务。

------

## 总结

通过本文的学习，你已经掌握了CentOS系统下Linux命令入门的基础知识：

✅ **目录操作**：`pwd`、`cd`和路径概念
✅ **文件操作**：`touch`、`cat`、`more`、`cp`、`mv`、`rm`
✅ **查找命令**：`which`、`find`
✅ **文本处理**：`grep`、`wc`和管道符
✅ **输出控制**：`echo`、`tail`和重定向符
✅ **文本编辑**：vim编辑器的基本使用
✅ **实战应用**：通过日志分析脚本串联所有知识点

这些命令是Linux日常使用的基石，掌握了它们，你就能在CentOS终端中完成大部分基本操作。记住，熟能生巧——多实践、多尝试，你会发现命令行不仅不可怕，反而非常高效。