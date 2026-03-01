# MyBlog 博客源码 (Hexo 分支)

这个分支包含了我的个人博客 ([https://zgj6017.github.io](https://zgj6017.github.io)) 的所有**源代码**和配置文件。该博客基于 [Hexo](https://hexo.io/) 框架构建，并部署在 GitHub Pages 上。

> **注意**：生成的静态文件（HTML/CSS/JS）会被部署到 `main` 分支，而当前的 `hexo` 分支用于源码管理和开发。

## 🛠️ 技术栈

*   **框架**: [Hexo](https://hexo.io/)
*   **主题**: [NexT (Gemini 风格)](https://theme-next.js.org/)
*   **部署**: GitHub Pages
*   **特色功能**:
    *   夜间模式代码高亮 (Night Theme)
    *   顶部阅读进度条
    *   带头像和目录的高级侧边栏
    *   已开启文章资源文件夹 (Post Asset Folder) 以便更好地管理图片

## 🚀 如何在本地运行

如果你在另一台电脑上克隆了这个仓库，请按照以下步骤恢复开发环境：

### 1. 前置准备
确保你的电脑上已经安装了：
*   [Node.js](https://nodejs.org/) (推荐 LTS 版本)
*   [Git](https://git-scm.com/)

### 2. 安装依赖
在项目根目录下运行以下命令：
```bash
npm install
```

### 3. 本地预览
启动本地服务器预览博客：
```bash
hexo server
# 或者使用简写: hexo s
```
打开浏览器访问：`http://localhost:4000`

## 📝 如何写新文章

### 1. 创建文章
```bash
hexo new "我的新文章标题"
```
这个命令会自动创建：
*   一个 Markdown 文件：`source/_posts/我的新文章标题.md`
*   一个同名资源文件夹：`source/_posts/我的新文章标题/`

### 2. 插入图片
将你的图片直接放入上面创建的**同名资源文件夹**中。
然后在 Markdown 文件中这样引用（**不要**加路径前缀）：
```markdown
{% asset_img image.png 图片说明 %}
```

### 3. 控制首页摘要
如果你想手动控制首页显示的文章摘要长度，请在正文希望截断的地方插入 `<!-- more -->`：
```markdown
这是显示在首页的摘要部分。
<!-- more -->
这里是点击阅读全文后才能看到的剩余内容。
```

## 📦 部署到线上

生成静态文件并推送到 GitHub Pages (main 分支)：

**方法一：使用脚本 (Windows 推荐)**
直接双击运行根目录下的 `一键部署.bat` 文件。

**方法二：手动命令**
```bash
hexo clean && hexo generate && hexo deploy
# 或者使用简写: hexo cl && hexo g && hexo d
```

## 📂 项目结构说明

*   `_config.yml`: 站点全局配置文件
*   `themes/next/_config.yml`: 主题配置文件
*   `source/_posts/`: 存放所有文章的 Markdown 文件
*   `scaffolds/`: 文章模版
*   `package.json`: 项目依赖列表

## ⚠️ 重要提示

*   **切勿删除** 根目录下的 `.git` 文件夹。
*   `themes/next` 文件夹已直接包含在本项目中（非子模块），你可以放心地修改主题配置并提交。
*   如果遇到页面样式错乱或图片不显示，请尝试先运行 `hexo clean` 清理缓存。
