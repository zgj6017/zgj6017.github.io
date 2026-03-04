title: 🚀 从零开始搭建个人博客：Hexo + GitHub Pages 完整教程（含代码详解）

tags: 

- Hexo
- GitHub Pages
- 教程

categories:

  - 技术文档

date: 2026-02-25 18:30:00

----------------------------------------------------------------------------------------

今天，我亲手搭建了自己的第一个博客。整个过程虽然遇到了一些小挫折，但最终成功上线！现在把我的经验整理成这篇教程，希望能帮到也想拥有个人博客的你。

<!-- more -->

## 🎯 为什么要搭建个人博客？

- 记录学习心得和技术笔记
- 分享生活感悟
- 打造个人品牌
- 完全掌控自己的内容

## 🛠️ 准备工作：安装必要工具

### 1. 安装 Git

Git是版本控制工具，用来把博客文件推送到GitHub。

```
# 下载地址：https://git-scm.com/
# 安装后验证版本
git --version
# 输出示例：git version 2.42.0.windows.2
```



### 2. 安装 Node.js

Hexo是基于Node.js的博客框架，需要Node.js环境来运行。

```
# 下载地址：https://nodejs.org/
# 一定要下载 LTS 版本（左边那个）
# 安装后验证版本
node -v
# 输出示例：v20.18.0  （必须≥20.19.0）

npm -v  
# 输出示例：10.8.2   （npm是Node.js的包管理器）
```



## 📦 搭建 Hexo 博客

### 第一步：安装 Hexo

```
# -g 表示全局安装，这样在任意目录都可以使用 hexo 命令
npm install -g hexo-cli

# 验证安装
hexo -v
# 输出 hexo-cli 版本号说明成功
```



### 第二步：初始化博客

```
# 在你想存放博客的目录下执行
# 比如我在 D:\Homework 目录下执行
cd D:\Homework

# init 命令会创建一个名为 MyBlog 的文件夹
# 并下载 Hexo 的基础模板文件
hexo init MyBlog

# 进入博客目录
cd MyBlog

# 安装项目所需的依赖包
# package.json 里列出的所有依赖都会被安装
npm install
```



**`npm install` 安装了什么？**

- `hexo`：Hexo 核心框架
- `hexo-server`：本地预览服务器
- `hexo-deployer-git`：Git 部署插件
- `hexo-renderer-marked`：Markdown 渲染器
- `hexo-renderer-stylus`：Stylus CSS 预处理器

### 第三步：了解博客目录结构

```
MyBlog/
├── node_modules/      # 存放所有依赖包（自动生成，不用管）
├── scaffolds/         # 模板文件夹，新建文章时会使用这里的模板
├── source/           # 存放你的文章和资源文件
│   └── _posts/       # 存放 Markdown 格式的文章
├── themes/           # 存放主题文件
├── _config.yml       # 博客的配置文件（重要！）
└── package.json      # 项目依赖配置文件
```



### 第四步：本地预览

```
# server 命令会启动一个本地服务器
hexo server
# 或者简写：hexo s

# 成功后会显示：
# INFO Hexo is running at http://localhost:4000/
# Press Ctrl+C to stop.
```



打开浏览器访问 `http://localhost:4000`，就能看到默认博客了！

## 🌐 部署到 GitHub Pages

### 1. 创建 GitHub 仓库

- 登录 GitHub
- 点击 "+" → "New repository"
- 仓库名必须是：`你的用户名.github.io`（例如我的 `zgj6017.github.io`）
- 设为 Public
- 点击 Create repository

### 2. 安装部署插件

```
# --save 参数会将插件添加到 package.json 的依赖列表中
# hexo-deployer-git 是专门用于部署到 Git 仓库的插件
npm install hexo-deployer-git --save
```



### 3. 修改配置文件

打开根目录的 `_config.yml`（这是博客的主配置文件），找到 `deploy` 部分：

```
# Site 站点信息（根据自己的情况修改）
title: 6017的博客        # 浏览器标签页显示的标题
subtitle: 记录学习与生活  # 副标题
description: 6017的个人博客  # 网站描述，对SEO友好
author: 6017           # 作者名称，会显示在文章底部
language: zh-CN        # 语言，zh-CN表示简体中文

# URL 设置
url: https://zgj6017.github.io  # 你的博客最终访问地址
root: /                 # 网站根目录

# 在文件末尾找到或添加 deploy 配置
deploy:
  type: git            # 部署类型：git
  repo: https://github.com/zgj6017/zgj6017.github.io.git  # 仓库地址
  branch: main         # 分支名称（GitHub 默认用 main）
```



### 4. 部署上线

```
# hexo clean：清除之前生成的静态文件（public 文件夹）
hexo clean

# hexo generate：根据主题和文章重新生成静态网页
hexo generate
# 或简写：hexo g

# hexo deploy：将生成的静态文件推送到 GitHub
hexo deploy
# 或简写：hexo d
```



**这三条命令的工作原理：**

1. `clean`：删除 `public/` 目录，确保生成的是全新的文件
2. `generate`：读取 `.md` 文章 → 应用主题模板 → 生成 `.html` 文件到 `public/`
3. `deploy`：将 `public/` 里的文件推送到 GitHub 仓库

等待1-2分钟，访问 `https://你的用户名.github.io` 就能看到你的博客了！

## 🎨 更换主题

### 1. 挑选主题

去 [Hexo 主题官网](https://hexo.io/themes/) 挑选喜欢的主题。每个主题都有对应的 GitHub 仓库地址。

### 2. 安装主题

以最流行的 Next 主题为例：

```
# git clone 命令会将整个主题仓库下载到本地
# 格式：git clone 仓库地址 themes/主题文件夹名
git clone https://github.com/theme-next/hexo-theme-next themes/next

# 这会在 themes 目录下创建一个 next 文件夹
# 里面就是完整的主题文件
```



### 3. 启用主题

修改根目录的 `_config.yml`：

```
# 找到 theme 字段，将默认的 landscape 改为你下载的主题名
theme: next  # 必须和 themes 文件夹下的名称完全一致（大小写敏感）
```



### 4. 配置主题（可选）

大多数主题都有自己的配置文件。对于 Next 主题：

```
# 复制主题的示例配置文件到根目录
# 这样可以方便地修改主题配置，同时不会影响主题源文件
cp themes/next/_config.yml _config.next.yml
```



### 5. 重新部署

```
# 一条命令完成清理、生成、部署
hexo clean && hexo generate && hexo deploy

# && 表示前一条命令成功后才执行下一条
```



## 🔧 遇到的问题及解决方法

### ❌ 问题1：Node.js 版本太旧

**错误信息：**

```
error hexo@8.1.1: The engine "node" is incompatible with this module. Expected version ">=20.19.0". Got "12.14.0"
```



**错误解析：**

- Hexo 8.x 需要 Node.js 20.19.0 或更高版本
- 你当前的 Node.js 是 12.14.0（2019年发布的）
- 版本相差太大，无法兼容

**解决方法：**

```
# 方案一：直接升级 Node.js
# 1. 控制面板卸载旧版 Node.js
# 2. 官网下载安装最新 LTS 版本

# 方案二：使用 nvm 管理 Node.js 版本（推荐）
# nvm 可以安装多个 Node.js 版本并随时切换

# 安装 nvm-windows（下载 nvm-setup.exe）
# https://github.com/coreybutler/nvm-windows/releases

# 安装最新 LTS 版本
nvm install lts

# 使用刚安装的版本
nvm use 20.18.0

# 验证版本
node -v  # 应该显示 v20.18.0 或更高
```



### ❌ 问题2：Git 克隆失败

**错误信息：**

```
fatal: unable to access '...': Recv failure: Connection was reset
```



**错误解析：**

- 网络连接问题，可能是 GitHub 被墙或网络不稳定

**解决方法：**

```
# 方案一：多试几次，网络有时候会波动
git clone [仓库地址]

# 方案二：使用代理（如果你有）
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890

# 方案三：使用镜像地址
# 将 github.com 替换为 github.com.cnpmjs.org
```



### ❌ 问题3：主题安装后报错 "No layout: index.html"

**错误信息：**

```
WARN No layout: index.html
```



**错误解析：**

- Hexo 找不到主题的布局文件
- 通常是因为主题名称配置错误或主题文件不完整

**解决方法：**

```
# 1. 检查主题文件夹名称
ls themes/
# 应该看到你安装的主题文件夹

# 2. 检查 _config.yml 中的配置
# theme: 后面的名字必须和 themes 下的文件夹名完全一致
# 比如 themes/next 对应 theme: next（小写）
# themes/Next 对应 theme: Next（首字母大写）

# 3. 检查主题是否有 index.ejs 或 index.swig 文件
ls themes/next/layout/
# 应该能看到 index.ejs 或 index.swig
```



### ❌ 问题4：复杂主题构建失败（以 Cosy 主题为例）

**错误信息：**

```
ERROR: Cannot find module '@cosy/ui'
```



**错误解析：**

- Cosy 主题使用 monorepo 架构，需要先构建内部模块
- `@cosy/ui` 是内部模块，不是 npm 公共包

**解决方法（如果坚持用 Cosy 主题）：**

```
# 1. 进入主题目录
cd themes/cosy

# 2. 安装 pnpm（Cosy 使用 pnpm 而不是 npm）
npm install -g pnpm

# 3. 安装依赖
pnpm install

# 4. 按顺序构建
pnpm build:util    # 先构建工具模块
pnpm build         # 再构建完整主题

# 5. 或者使用开发模式
pnpm dev           # 启动开发服务器
# 新开一个终端
pnpm dev:hexo      # 启动热更新的 Hexo
```



**建议：** 如果主题太复杂，直接换用稳定主题（如 Next、Fluid），不要浪费时间在折腾主题上。

## ✨ 个性化设置

### 修改博客信息

编辑 `_config.yml`：

```
# Site 站点信息
title: 6017的博客        # 浏览器标签页显示的标题
subtitle: 记录学习与生活  # 副标题
description: 6017的个人博客  # 网站描述，用于搜索引擎
author: 6017           # 作者名称
language: zh-CN        # 语言设置
timezone: Asia/Shanghai # 时区设置
```



### 写第一篇文章

```
# new 命令会创建一个新的 Markdown 文件
# 文件会保存在 source/_posts/ 目录下
hexo new "我的第一篇博客"
```



生成的 Markdown 文件内容：

```
---
title: 我的第一篇博客     # 文章标题
date: 2026-02-25 17:45:55  # 创建时间（自动生成）
tags:                    # 标签（可以多个）
  - 生活
  - 记录
categories: 随笔        # 分类
---

这是文章的开头部分。

## 二级标题

这是正文内容。用 Markdown 语法写作：

- 列表项1
- 列表项2

**加粗文字** *斜体文字*

[链接文字](https://example.com)

![图片描述](/images/example.jpg)

> 引用文字

`代码块`
```



### Markdown 语法速查

[详细Markdown语法](https://zgj6017.github.io/2025/12/18/Markdown%E5%9F%BA%E6%9C%AC%E8%AF%AD%E6%B3%95/)

```
# 一级标题
## 二级标题
### 三级标题

**加粗**        → <b>加粗</b>
*斜体*          → <i>斜体</i>
`代码`          → <code>代码</code>

[超链接](网址)   → 超链接
![图片](图片地址) → 图片

- 无序列表
1. 有序列表

> 引用

| 表格 | 标题 |
|------|------|
| 内容1 | 内容2 |
```



## 📌 日常使用流程

### 写新文章

```
# 创建新文章
hexo new "文章标题"

# 会在 source/_posts/ 生成 文章标题.md 文件
# 用 VS Code 或任何文本编辑器打开编辑
```



### 本地预览

```
# 启动本地服务器
hexo server
# 访问 http://localhost:4000 预览效果
# 按 Ctrl+C 停止服务器
```



### 部署更新

```
# 完整部署命令
hexo clean        # 清理缓存
hexo generate     # 生成静态文件
hexo deploy       # 部署到 GitHub

# 或者一行搞定
hexo clean && hexo generate && hexo deploy
```



## 💡 常用命令速查表

| 命令                     | 简写            | 作用                   |
| :----------------------- | :-------------- | :--------------------- |
| `hexo server`            | `hexo s`        | 启动本地预览服务器     |
| `hexo generate`          | `hexo g`        | 生成静态文件           |
| `hexo deploy`            | `hexo d`        | 部署到远程仓库         |
| `hexo clean`             |                 | 清理缓存文件           |
| `hexo new "标题"`        | `hexo n "标题"` | 创建新文章             |
| `hexo new page "页面名"` |                 | 创建新页面（如关于页） |
| `hexo list`              |                 | 列出所有文章           |

## 🎉 结语

经过一天的折腾，我的博客终于搭建完成了！虽然过程中遇到了版本问题、主题构建问题等各种坑，但每一个问题都让我对 Hexo 的理解更深一层。

如果你也在搭建博客的过程中遇到问题，欢迎留言交流。记住：**博客最重要的是开始写作**，而不是在主题配置上花费太多时间。

现在，我的博客地址是：`https://zgj6017.github.io`

你也快来试试吧！