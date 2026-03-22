# Image Editor Skill

图像编辑工具集 - 替代 Photoshop 的轻量级解决方案

## 安装

```bash
pip install pillow opencv-python rembg
```

## 功能

| 工具 | 描述 |
|------|------|
| `background_remover.py` | 一键抠图去背 |
| `upscaler.py` | AI 超分放大 |
| `filters.py` | 滤镜调色 |
| `converter.py` | 格式转换 |

## 使用

```bash
# 抠图
python tools/background_remover.py input.jpg output.png

# 放大
python tools/upscaler.py input.jpg output.png --scale 2

# 滤镜
python tools/filters.py input.jpg output.jpg --brightness 1.2
```
