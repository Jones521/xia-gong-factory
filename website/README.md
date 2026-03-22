# 🦐 虾工厂网站部署指南

## 部署到 Vercel (推荐)

### 步骤 1：准备文件

确保网站文件在同一个目录：
```
website/
├── index.html
├── og-image.png (可选，分享封面图)
└── qr-code.png (飞书群二维码)
```

### 步骤 2：注册 Vercel

1. 访问 https://vercel.com
2. 用 GitHub/GitLab 账号登录
3. 点击 "Add New Project"

### 步骤 3：部署

**方式 A：直接上传（最简单）**

1. 安装 Vercel CLI:
   ```bash
   npm i -g vercel
   ```

2. 部署:
   ```bash
   cd website
   vercel --prod
   ```

**方式 B：GitHub 连接**

1. 创建 GitHub 仓库
2. 上传 website 文件夹内容
3. Vercel 连接 GitHub 仓库
4. 自动部署

### 步骤 4：自定义域名（可选）

1. Vercel 控制台 → Settings → Domains
2. 添加你的域名
3. 配置 DNS

---

## 部署到 HuggingFace Spaces (免费)

### 步骤

1. 注册 https://huggingface.co
2. 创建新 Space (选 Static 类型)
3. 上传 index.html
4. 自动部署，获得 `xxx.huggingface.app` 域名

---

## 部署到 Netlify

### 步骤

1. 注册 https://netlify.com
2. 拖拽 website 文件夹到部署区
3. 获得 `xxx.netlify.app` 域名

---

## 网站文件清单

| 文件 | 必需 | 说明 |
|------|------|------|
| index.html | ✅ | 主页面 |
| og-image.png | ⭕ | 社交分享封面 |
| qr-code.png | ⭕ | 飞书群二维码 |
| favicon.ico | ⭕ | 网站图标 |
| download.html | ⭕ | 下载页面 |
| tutorial.html | ⭕ | 教程页面 |

---

## 网站优化建议

### SEO

```html
<!-- 在 index.html 的<head>中添加 -->
<meta name="description" content="虾工厂 - OpenClaw 训练专家">
<meta name="keywords" content="AI 助手，OpenClaw, 自动化">
<link rel="canonical" href="https://你的域名.com">
```

### 数据统计

```html
<!-- Vercel Analytics -->
<script src="https://cdn.vercel-insights.com/v1/script.js"></script>

<!-- 百度统计 -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?你的统计 ID";
  document.getElementsByTagName("head")[0].appendChild(hm);
})();
</script>
```

### 转化优化

1. **首屏清晰** - 一眼看懂是啥
2. **行动按钮醒目** - "免费开始" 按钮要大
3. **社会证明** - 用户评价、使用数据
4. **紧迫感** - "只限前 5 名"
5. **降低门槛** - "免费"、"3 分钟上手"

---

## 小红书引流技巧

### 主页设置

```
昵称：虾工厂 Masterclaw
简介：帮你训虾，帮虾干活 🦐
      网站：xia-gong-factory.vercel.app
      飞书群↓ [链接]
```

### 笔记引流

1. 笔记正文不放链接（会被限流）
2. 引导看主页
3. 置顶笔记放网站链接
4. 私信自动回复链接

---

🦐 虾工厂 - 网站部署指南
