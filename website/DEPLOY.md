# 🚀 一键部署到 Vercel

## 前置要求

- 已安装 Node.js (https://nodejs.org/)
- 有 Vercel 账号（可用 GitHub/邮箱注册）

---

## 方式 1：Vercel CLI 部署（推荐）

### 步骤 1：安装 Vercel CLI

打开 PowerShell（管理员），运行：

```powershell
npm install -g vercel
```

### 步骤 2：登录 Vercel

```powershell
vercel login
```

按提示选择登录方式（GitHub/GitLab/邮箱）

### 步骤 3：部署网站

```powershell
# 进入网站目录
cd D:\openclaw-sim\website

# 部署到生产环境
vercel --prod
```

### 步骤 4：获取网址

部署完成后，Vercel 会返回一个网址：
```
https://xia-gong-factory-xxx.vercel.app
```

---

## 方式 2：GitHub 连接部署

### 步骤 1：创建 GitHub 仓库

```powershell
# 安装 GitHub CLI（如已安装可跳过）
winget install GitHub.cli

# 创建仓库
gh repo create xia-gong-factory --public
```

### 步骤 2：上传代码

```powershell
cd D:\openclaw-sim\website
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/你的用户名/xia-gong-factory.git
git push -u origin main
```

### 步骤 3：Vercel 连接

1. 访问 https://vercel.com/new
2. 选择 "Import Git Repository"
3. 选择刚才创建的仓库
4. 点击 "Deploy"

---

## 方式 3：Netlify 拖拽部署（最简单）

### 步骤

1. 访问 https://app.netlify.com/drop
2. 把 `D:\openclaw-sim\website` 文件夹拖进去
3. 获得网址：`https://xxx.netlify.app`

无需命令行！

---

## 自定义域名（可选）

### Vercel 设置

1. 访问 Vercel Dashboard
2. 选择项目 → Settings → Domains
3. 添加你的域名
4. 按提示配置 DNS

### DNS 配置

```
类型    名称    内容
A       @       76.76.21.21
CNAME   www     cname.vercel-dns.com
```

---

## 部署后验证

访问部署后的网址，检查：

- [ ] 首页正常显示
- [ ] "免费开始"按钮可点击
- [ ] 飞书群链接正确
- [ ] 手机端显示正常

---

## 常见问题

### Q: 部署失败怎么办？
```
检查：
1. Node.js 是否安装
2. 网络是否正常（可能需要代理）
3. Vercel 账号是否登录
```

### Q: 如何更新网站？
```
# 修改 index.html 后重新部署
cd D:\openclaw-sim\website
vercel --prod
```

### Q: 国内访问慢？
```
方案 1：使用 Netlify（国内访问较快）
方案 2：部署到国内云服务（腾讯云/阿里云）
方案 3：使用 Cloudflare CDN
```

---

🦐 虾工厂 - 部署指南
