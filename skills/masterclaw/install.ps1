# 🦐 虾工厂 Masterclaw 一键安装脚本 (GitHub 版)
# 使用方法：iwr https://raw.githubusercontent.com/xia-gong-factory/masterclaw/main/install.ps1 -useb | iex

Write-Host "🦐 虾工厂 Masterclaw 安装程序" -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Cyan

# 获取 openclaw 路径
$OpenClawPath = "$env:USERPROFILE\.openclaw\skills"

if (-not (Test-Path $OpenClawPath)) {
    Write-Host "错误：未找到 openclaw，请先安装 openclaw" -ForegroundColor Red
    Write-Host "运行：npm install -g openclaw" -ForegroundColor Yellow
    exit 1
}

# 创建目录
$MasterClawPath = Join-Path $OpenClawPath "masterclaw"
Write-Host "正在安装到：$MasterClawPath" -ForegroundColor Green

if (Test-Path $MasterClawPath) {
    Write-Host "警告：已存在 masterclaw，是否覆盖？(Y/N)" -ForegroundColor Yellow
    $confirm = Read-Host
    if ($confirm -ne "Y" -and $confirm -ne "y") {
        Write-Host "已取消" -ForegroundColor Yellow
        exit 0
    }
    Remove-Item $MasterClawPath -Recurse -Force
}

New-Item -ItemType Directory -Path $MasterClawPath | Out-Null

# 从 GitHub 下载
$ZipPath = "$env:TEMP\masterclaw.zip"
Write-Host "正在从 GitHub 下载..." -ForegroundColor Green
Invoke-WebRequest -Uri "https://github.com/xia-gong-factory/masterclaw/archive/refs/heads/main.zip" -OutFile $ZipPath

# 解压
Write-Host "正在解压..." -ForegroundColor Green
Expand-Archive -Path $ZipPath -DestinationPath "$env:TEMP" -Force

# 复制文件
Copy-Item "$env:TEMP\masterclaw-main\*" $MasterClawPath -Recurse -Force

# 清理
Remove-Item $ZipPath -Force
Remove-Item "$env:TEMP\masterclaw-main" -Recurse -Force

Write-Host "✅ 安装完成！" -ForegroundColor Green
Write-Host "请重启 openclaw 后使用" -ForegroundColor Cyan
Write-Host ""
Write-Host "对 OpenClaw 说：'我想训一只虾'" -ForegroundColor Cyan
