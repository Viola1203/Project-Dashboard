# 项目需求看板 · GitHub Pages 发布说明

部署包已生成在 `ghpages/` 目录，共 12 个文件：

- `index.html`（看板主程序，**v3.104**）
- `sw.js`（Service Worker，缓存版本 **`kanban-project-v66`**）
- `manifest.json`（PWA 清单）
- `app-192.png` / `app-512.png` / `app-maskable-512.png` / `app-icon.svg` / `favicon-32.png` / `favicon.svg`
- `README.md` / `PUBLISH.md`（发布说明）
- `publish_device.bat` / `publish_device.py`（推荐的一键发布脚本）

目标仓库：`github.com/Viola1203/Project-Dashboard`
发布分支：`main`（根目录，Site root 即 `/`）
访问地址：**`https://Viola1203.github.io/Project-Dashboard/`**

> 注意：本仓库之前挂的是 v3.99 / `kanban-project-v61`，本次发布更新到 v3.104 / v66。

---

## 方式 A：一键发布脚本（推荐，最省事）

在 `ghpages/` 文件夹里**双击 `publish_device.bat`**，脚本会：

1. 打印一个网址和 8 位授权码 → 你在浏览器打开、输入码、点 Authorize
2. 自动推送全部 12 个文件到 `main` 分支
3. 自动开启 GitHub Pages（`main` / `(root)`）
4. 自动触发构建并校验线上版本

全程不需要生成、复制或粘贴任何 Token。跑完按提示打开网址、`Ctrl+Shift+R` 硬刷新即可。

> 脚本只用 Python 标准库，无需 pip 安装。若提示"未找到 Python"，用系统自带的 `python` 即可：
> `python publish_device.py`

## 方式 A'：已有 Personal Access Token

若你更习惯自己生成 Token（权限只需勾选 `repo`）：

```
python publish_device.py --token 你的Token
```

生成入口：https://github.com/settings/tokens?type=classic （丢了 `/type=classic` 会跳到新版页面，那里生成不了旧版 Token）

## 方式 B：GitHub 网页手动上传（无需任何脚本）

1. 打开仓库 `https://github.com/Viola1203/Project-Dashboard`
2. 确认当前在 `main` 分支
3. **Add file → Upload files**，把本目录全部文件拖进去（覆盖同名文件，建议**只传 `index.html` 和 `sw.js`**）
4. 提交（Commit）
5. **Settings → Pages**：Source 选 `Deploy from a branch` → 分支 `main` / 目录 `(root)` → Save
6. 1~2 分钟后访问 `https://Viola1203.github.io/Project-Dashboard/`

## 方式 C：本地 Git 推送

双击 `publish.bat`（需要本机已配置 GitHub 凭据，保留备用）。

## 方式 B：GitHub 网页上传（无需 Git）

1. 打开仓库 `https://github.com/Viola1203/Project-Dashboard`
2. 确认当前在 `main` 分支
3. **Add file → Upload files**，把本目录全部文件拖进去（覆盖同名文件）
4. 提交（Commit）
5. **Settings → Pages**：Source 选 `Deploy from a branch` → 分支 `main` / 目录 `(root)` → Save
6. 1~2 分钟后访问 `https://Viola1203.github.io/Project-Dashboard/`

---

## 开启 Pages 后

- 站点公网可访问；但看板数据只存在你浏览器本地 `localStorage`（前缀 `wb_prm_`），服务器不存任何业务数据。
- 首次访问建议 **Ctrl+Shift+R 硬刷新**，让新版 SW（`v66`）接管缓存。

## 一次性数据迁移（旧站 → 新站）

看板数据绑定来源域名，切域名后旧数据不会自动跟随：

1. 在旧站打开看板 → 设置 → 导出数据（JSON）
2. 在新站打开 → 设置 → 导入该 JSON

## 后续更新流程

`项目需求看板_V1.html` → `cp` 到 `webroot/index.html` 与 `ghpages/index.html`（md5 需一致）→
改 `sw.js` 的 `CACHE` 版本号 +1 → 推 `main` → Pages 自动重新部署（约 1 分钟）。

> 每次改动看板逻辑后**务必**把 `sw.js` 的 `CACHE` +1，否则用户端不会拉取新版本。
