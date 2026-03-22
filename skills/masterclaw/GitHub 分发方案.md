# 🦐 虾工厂 GitHub 分发方案

## 方案说明

通过 GitHub 仓库 + GitHub Pages 进行分发，无需国内云存储

---

## 架构图

```
┌─────────────────────────────────────────────────────────────┐
│                  GitHub 分发架构                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  【代码托管】GitHub Repository                              │
│  github.com/xia-gong-factory/masterclaw                    │
│  - skills/masterclaw/  (核心代码)                           │
│  - install.ps1/sh    (安装脚本)                              │
│  - README.md         (项目说明)                              │
│                                                             │
│  【官网】GitHub Pages                                       │
│  xia-gong-factory.github.io                                │
│  - index.html        (落地页)                                │
│  - 自动部署、免费托管                                       │
│                                                             │
│  【下载】GitHub Releases / Raw                              │
│  - 安装脚本从 Raw 下载 ZIP                                    │
│  - 或 Releases 发布二进制文件                                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 实施步骤

### 阶段 1：创建 GitHub 组织

```
1. 访问 https://github.com/organizations/new
2. 组织名：xia-gong-factory
3. 选择免费计划
```

### 阶段 2：创建 masterclaw 仓库

```
1. 点击右上角 "+" → "New repository"
2. 仓库名：masterclaw
3. 描述：虾工厂 Masterclaw - OpenClaw 训练专家
4. 勾选 "Public"
5. 勾选 "Add a README file"
6. 点击 "Create repository"
```

### 阶段 3：上传代码

```powershell
# 进入项目目录
cd D:\openclaw-sim

# 初始化 git
git init

# 添加远程仓库
git remote add origin https://github.com/xia-gong-factory/masterclaw.git

# 添加文件
git add skills/masterclaw/
git add website/

# 提交
git commit -m "Initial commit: 虾工厂 Masterclaw"

# 推送
git branch -M main
git push -u origin main
```

### 阶段 4：启用 GitHub Pages

```
1. 仓库 → Settings → Pages
2. Source: Deploy from a branch
3. Branch: main / Folder: /website (或根目录)
4. 点击 Save

等待几分钟，获得网址：
https://xia-gong-factory.github.io/masterclaw/
```

### 阶段 5：修改安装脚本

修改 `install.ps1` 和 `install.sh`，从 GitHub 下载：

```powershell
# install.ps1
$DownloadUrl = "https://github.com/xia-gong-factory/masterclaw/archive/refs/heads/main.zip"
```

---

## 网站部署方案

### 方案 A：GitHub Pages (推荐)

```yaml
# 创建 .github/workflows/deploy.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./website
```

### 方案 B：Vercel 连接 GitHub

```
1. Vercel 连接 GitHub 仓库
2. 选择 masterclaw 仓库
3. Root Directory 设为 website/
4. 自动部署
```

---

## 安装脚本（GitHub 版本）

### install.ps1

```powershell
# 虾工厂 Masterclaw 一键安装脚本 (GitHub 版)
# 使用：iwr https://raw.githubusercontent.com/xia-gong-factory/masterclaw/main/install.ps1 -useb | iex

$DownloadUrl = "https://github.com/xia-gong-factory/masterclaw/archive/refs/heads/main.zip"
$ZipPath = "$env:TEMP\masterclaw.zip"
$OpenClawPath = "$env:USERPROFILE\.openclaw\skills"
$MasterClawPath = Join-Path $OpenClawPath "masterclaw"

Write-Host "🦐 虾工厂 Masterclaw 安装程序" -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Cyan

# 下载
Write-Host "正在下载..." -ForegroundColor Green
Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipPath

# 解压安装
# ... (解压逻辑同原版)
```

### install.sh

```bash
#!/bin/bash
# 虾工厂 Masterclaw 一键安装脚本 (GitHub 版)
# 使用：curl -sL https://raw.githubusercontent.com/xia-gong-factory/masterclaw/main/install.sh | bash

DOWNLOAD_URL="https://github.com/xia-gong-factory/masterclaw/archive/refs/heads/main.zip"

echo "🦐 虾工厂 Masterclaw 安装程序"
echo "=============================="

# 下载
echo "正在下载..."
curl -sL $DOWNLOAD_URL -o /tmp/masterclaw.zip

# 解压安装
# ... (解压逻辑同原版)
```

---

## 优势对比

| 方案 | GitHub 分发 | 云存储分发 |
|------|------------|-----------|
| 代码可信度 | ⭐⭐⭐⭐⭐ (开源) | ⭐⭐⭐ |
| 国内访问速度 | ⭐⭐ (需代理) | ⭐⭐⭐⭐⭐ |
| 更新便利性 | ⭐⭐⭐⭐ (git pull) | ⭐⭐⭐ |
| 国际化 | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| 技术形象 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |

---

## 推荐策略

**国内用户：** 云存储分发（蓝奏云 + 飞书）
**海外用户/技术人员：** GitHub 分发

可以两套方案同时存在，用户自选。

---

## GitHub 仓库结构

```
masterclaw/
├── README.md                 # GitHub 项目说明
├── LICENSE                   # MIT 许可
├── .gitignore                # Git 忽略文件
│
├── skills/
│   └── masterclaw/
│       ├── AGENT.md
│       ├── README.md
│       ├── INSTALL.md
│       ├── package.json
│       ├── config.json
│       ├── install.ps1
│       └── install.sh
│
├── website/
│   ├── index.html
│   └── README.md
│
└── .github/
    └── workflows/
        └── deploy.yml        # 自动部署
```

---

## 自动发布流程

```
git push → GitHub Actions → Deploy to Pages
                                    ↓
                      更新官网：xia-gong-factory.github.io
```

---

## 注意事项

### 1. GitHub 访问问题

国内用户访问 GitHub 可能慢，建议：
- 安装脚本提供国内镜像源（Gitee）
- 或提供云存储备选方案

### 2. Gitee 镜像（备选）

```
1. 同步仓库到 Gitee: gitee.com/xia-gong-factory/masterclaw
2. 安装脚本检测网络，自动选择 GitHub/Gitee
```

### 3. Releases 发布

```
1. 仓库 → Releases → Create new release
2. 上传 masterclaw.zip
3. 用户可直接下载
```

---

## 一键导入脚本

```powershell
# 从 GitHub 克隆并安装
$repo = "https://github.com/xia-gong-factory/masterclaw.git"
git clone $repo "$env:TEMP\masterclaw-git"
Copy-Item "$env:TEMP\masterclaw-git\skills\masterclaw" "$env:USERPROFILE\.openclaw\skills\" -Recurse
Write-Host "✅ 安装完成！"
```

---

🦐 虾工厂 - GitHub 分发方案
