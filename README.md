# G2-F01 · Godot Production Line Template

## Branch Strategy
- main: stable releases
- dev: daily development
- feature-*: short-lived task branches

## 目录结构（标准）
- `scenes/`：场景文件（*.tscn）
- `scripts/`：GDScript 脚本（*.gd）
- `ui/`：UI 场景与主题
- `assets/`：原始素材
  - `sprites/` 像素图与序列帧
  - `sfx/` 音效
  - `bgm/` 背景音乐
  - `fonts/` 字体
- `data/`：存档与配置（运行时读取）
- `export/win/`：Windows 构建输出（.exe 等）  
  > 以 `.gitkeep` 占位，保证空目录被 Git 跟踪

## 统一输入映射（已配置）
- move_left（A / ←）
- move_right（D / →）
- move_up（W / ↑）
- move_down（S / ↓）
- jump（Space）
- pause（Esc）
- interact（E）

## 引擎环境（记录）
- Godot：4.5（简体中文界面）
- 渲染器：兼容性（Compatibility）