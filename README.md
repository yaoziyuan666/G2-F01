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

## 资源与命名规范（Assets & Naming）
- 目录：
  - `assets/tilesets/<包名>/`：图块贴图与 TileSet 资源（*.png, *.tres）
  - `assets/sprites/`：通用精灵（角色、道具）
  - `assets/sfx/`：音效（*.wav/*.ogg）
  - `assets/bgm/`：背景音乐
  - `assets/fonts/`：字体
  - `scenes/`：场景（*.tscn）
  - `scripts/`：脚本（*.gd）
  - `ui/`：UI 场景与主题
- 命名前缀：
  - 贴图：`spr_<主题>_<尺寸>`，例 `spr_tile_grass_16.png`
  - TileSet 资源：`ts_<包名>_<尺寸>.tres`，例 `ts_basic_16.tres`
  - 场景（可实例复用的子物体）：`<Name>.tscn`（帕斯卡命名），例 `Coin.tscn`
  - 脚本：`snake_case.gd`，与场景同名/同目的，例 `coin.gd`
- 规范：
  - 统一像素网格：**16×16**（本项目主规格；32×32 作为扩展）
  - 导入：默认 **Nearest / Mipmaps Off / Repeat Disabled / Lossless**
  - 不得直接把导出产物放进仓库：导出目录仅 `export/win/`，空目录用 `.gitkeep`

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
