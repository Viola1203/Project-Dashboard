# 项目需求看板 (Project Dashboard)

单文件离线 PWA 项目管理看板：总览 / 项目 / 需求 / 任务 / 甘特 / 待办 / 灵感 / 设置 八大模块，
支持 Eisenhower 四象限优先级、自定义状态、列宽拖拽、数据导入导出与离线使用。

- **在线地址**：https://Viola1203.github.io/Project-Dashboard/
- **当前版本**：v3.104（Service Worker 缓存 `kanban-project-v66`）
- **数据存储**：浏览器 `localStorage`（前缀 `wb_prm_`），服务器不保存任何业务数据

## 使用

1. 打开上面的在线地址（或把 `index.html` 下载到本地双击打开）
2. 手机端：浏览器菜单 → "添加到主屏幕"，即可像 App 一样使用
3. 数据只在本机浏览器，换设备/换域名时用「设置 → 导出数据 / 导入数据」迁移

> 若页面行为异常（特别是改版后没生效），按 **Ctrl+Shift+R** 硬刷新一次，
> 让新版 Service Worker 接管缓存。

## 本地目录说明

| 文件 | 说明 |
| --- | --- |
| `index.html` | 看板主程序（单文件，含全部样式与逻辑） |
| `sw.js` | Service Worker，改版后需同步调高 `CACHE` 版本号 |
| `manifest.json` | PWA 清单 |
| `app-192.png` / `app-512.png` / `app-maskable-512.png` | 应用图标 |
| `app-icon.svg` / `favicon.svg` / `favicon-32.png` | 矢量图标与 favicon |
| `PUBLISH.md` | 发布说明 |
| `publish_device.bat` / `publish_device.py` | **推荐**的一键发布脚本（设备授权，不用生成 Token） |
| `publish.bat` | 旧版 git 推送脚本（需要自己配凭据，保留备用） |
