#!/bin/bash
# 🦐 虾工厂 Masterclaw 一键安装脚本 (GitHub 版)
# 使用：curl -sL https://raw.githubusercontent.com/xia-gong-factory/masterclaw/main/install.sh | bash

set -e

OPENCLAW_PATH="$HOME/.openclaw/skills"
MASTERCLAW_PATH="$OPENCLAW_PATH/masterclaw"

echo "🦐 虾工厂 Masterclaw 安装程序"
echo "=============================="

if [ ! -d "$OPENCLAW_PATH" ]; then
    echo "❌ 错误：未找到 openclaw，请先安装 openclaw"
    echo "运行：npm install -g openclaw"
    exit 1
fi

echo "正在安装到：$MASTERCLAW_PATH"

if [ -d "$MASTERCLAW_PATH" ]; then
    echo "⚠️  已存在 masterclaw，是否覆盖？(y/N)"
    read -r confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo "已取消"
        exit 0
    fi
    rm -rf "$MASTERCLAW_PATH"
fi

mkdir -p "$MASTERCLAW_PATH"

echo "正在从 GitHub 下载..."
curl -sL "https://github.com/xia-gong-factory/masterclaw/archive/refs/heads/main.zip" -o /tmp/masterclaw.zip

echo "正在解压..."
unzip -q /tmp/masterclaw.zip -d /tmp/

echo "正在复制文件..."
cp -r /tmp/masterclaw-main/* "$MASTERCLAW_PATH/"

echo "正在清理..."
rm -f /tmp/masterclaw.zip
rm -rf /tmp/masterclaw-main

echo "✅ 安装完成！"
echo "请重启 openclaw 后使用"
echo ""
echo "对 OpenClaw 说：'我想训一只虾'"
