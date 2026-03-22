# 🦐 虾工厂网站 - 一键部署到 Vercel
# 使用方法：右键此文件 → 使用 PowerShell 运行

Write-Host "🦐 虾工厂网站部署程序" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan
Write-Host ""

# 检查 Node.js
Write-Host "检查 Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node -v
    Write-Host "✓ Node.js 已安装：$nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ 未安装 Node.js，请先访问 https://nodejs.org 安装" -ForegroundColor Red
    exit 1
}

# 检查 Vercel CLI
Write-Host "检查 Vercel CLI..." -ForegroundColor Yellow
$vercelInstalled = $false
try {
    $vercelVersion = vercel --version 2>&1
    if ($vercelVersion -like "*error*" -or $vercelVersion -like "*命令*" -or $vercelVersion -like "*不是*") {
        throw "not installed"
    }
    Write-Host "✓ Vercel CLI 已安装：$vercelVersion" -ForegroundColor Green
    $vercelInstalled = $true
} catch {
    Write-Host "Vercel CLI 未安装，正在安装..." -ForegroundColor Yellow
    npm install -g vercel
    $vercelInstalled = $true
}

# 切换目录
$websitePath = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host "网站目录：$websitePath" -ForegroundColor Cyan
Set-Location $websitePath

# 登录提示
Write-Host ""
Write-Host "首次使用需要登录 Vercel" -ForegroundColor Yellow
Write-Host "按任意键继续，将打开浏览器登录..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

vercel login

# 部署
Write-Host ""
Write-Host "开始部署..." -ForegroundColor Green
Write-Host ""

$deployOutput = vercel --prod 2>&1
Write-Host $deployOutput

# 提取网址
if ($deployOutput -match "https://[^\s]+") {
    $url = $matches[0]
    Write-Host ""
    Write-Host "✅ 部署成功！" -ForegroundColor Green
    Write-Host "网站地址：$url" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "正在打开浏览器预览..."
    Start-Process $url
} else {
    Write-Host ""
    Write-Host "⚠️ 部署完成，请检查输出获取网址" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
