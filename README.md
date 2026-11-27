# 一副透镜牌 · 中文版 (A Deck of Lenses, 中文)

Jesse Schell《游戏设计艺术》配套「透镜牌」网页应用的简体中文版。

所有素材（116 张牌面大图、缩略图、牌背、装饰图、字体文件）都随仓库提供，**整站离线可用，不依赖官方站点**。

## 在线访问

**<https://cinatas.github.io/A-Deck-of-Lenses-In-Chinese/>**

由 GitHub Pages 托管（`main` 分支 `/docs` 目录），纯静态、无外部依赖。

## 本地打开

```bash
git clone https://github.com/Cinatas/A-Deck-of-Lenses-In-Chinese.git
cd A-Deck-of-Lenses-In-Chinese
./serve.sh            # 默认 8899 端口，也可 ./serve.sh 8080
```

浏览器访问 **http://127.0.0.1:8899/** 即可（默认就是中文）。

`serve.sh` 只是 `python3 -m http.server` 的包装，把 `docs/` 目录托管到本地；用任何静态服务器（nginx、caddy、`npx serve`）指向 `docs/` 也一样。

页面是竖屏手机比例，桌面浏览器建议把窗口收窄，或直接用手机/平板访问。右上角语言下拉可在 **简体中文 / English / 日本語** 之间切换。

> 必须用本地 HTTP 服务打开，直接双击 `index.html`（file:// 协议）会因为浏览器安全策略拿不到牌库数据。

## 翻译范围

| 内容 | 数量 | 状态 |
|---|---|---|
| 透镜卡正文（标题、引导语、问题） | 116 张 / 451 个问题 | 全部译完 |
| 界面文案（按钮、菜单、排序、分类） | 51 条 | 全部译完 |
| 使用说明三页（怎么设计游戏 / 怎么用牌 / 怎么获得原著） | 3 页 | 全部译完 |
| 牌面插画 | 116 幅 | 随仓库提供，本地加载 |
| 画师署名、品牌与人名 | — | 保留原文（署名属于作品信息，不译） |
| 商品照片里印着的英文 | 2 张产品图 | 保留（实体商品实拍，不可改） |

术语按《游戏设计艺术》中译本习惯统一：lens=透镜、Experience=体验、Player=玩家、Process=流程、Mechanics=机制、Endgame 类词用「内生价值/元素四分法/全息设计」等既有译法。

## 目录

```
artofgamedesign/
├── docs/                 # 中文版整站（可直接拷走、放到任意静态服务器）
│   ├── index.html
│   ├── assets/strings/zh.json   # 中文牌库与文案（新增）
│   ├── assets/strings/en.json   # 英文原版，保留，供切换
│   ├── assets/strings/jp.json   # 日文官方版，保留
│   ├── assets/images/           # 牌面大图 116 张 + 缩略图 + 界面图标
│   ├── fonts/                   # 字体（含 DistrictPro 与原站同款）
│   ├── css/                     # 加了中文字体回退
│   └── js/
├── serve.sh
├── screenshots/             # 效果截图
└── README.md
```

## 改了什么（共 4 处，都可回退）

1. **牌库与文案中文化**：新增 `docs/assets/strings/zh.json`（结构与官方 `en.json` 完全一致：`scales` / `strings` / `LensList`）。
2. **设为默认语言**：把 `js/app.95e37080.js` 里内嵌的牌库数据替换为中文（原站是「无 `?lang` 参数 → 用内嵌英文」），并把默认语言标记改为 `zh`；同时把中文加进 `assets/json/languages.json` 的语言列表。这样首屏直接是中文，深链接（如 `#/menu/1`）也照常工作。
3. **中文字体回退**：`css/app.css` 里 42 条 `font-family` 规则追加 `WenQuanYi Zen Hei / PingFang SC / 微软雅黑 / Noto Sans CJK SC` 等回退（跳过 `@font-face`，不影响原字体加载）。拉丁字母仍用原本的 DistrictPro，汉字落到系统中文字体。
4. **素材本地化**：116 张牌面大图、缩略图、牌背、首页扇形卡图、字体全部随仓库提供（约 60MB），不请求任何外部域名。
5. **样式微调**：「十周年纪念版」标签在中文下改为居中。

> 另外补了两处上游缺失：说明页示例牌换成中文卡片渲染；`lensArt/PLACEHOLDER.png` 与 `lensArt/.png`（原站 404 的占位图）生成了一张中性占位图，避免翻牌动画时出现破图。

## 已知小差异

- 首页「十周年纪念版」标签沿用原版位置，会压在橙色像素装饰上，中文较短时对比度略低。
- 排序菜单里的「字母序」对中文而言实际按拼音/字符序排列，与英文原版语义一致但观感不同。

## 版权

牌面文字、插画、字体与商标版权归 **Jesse Schell / Schell Games** 及相关字体厂商所有。本仓库是个人学习用途的本地化副本，随仓库分发的插画与字体并未获得授权，**请勿商用或再分发**。想支持作者请购买正版：

- 书：<https://www.amazon.com/Art-Game-Design-Lenses-Third-dp-1138632058/dp/1138632058>
- 实体牌：<https://www.amazon.com/Art-Game-Design-Deck-Lenses/dp/B0FVB9QQCJ>
- 原站：<https://deck.artofgamedesign.com/>

## 源码改动速查

| 文件 | 作用 |
|---|---|
| `docs/assets/strings/zh.json` | 全部中文牌库与界面文案（可单独替换/校对） |
| `docs/js/app.95e37080.js` | 内嵌数据替换为中文、默认语言 `zh` |
| `docs/assets/images/` | 牌面大图与缩略图（本地） |
| `docs/css/app.4b9546c8.css` | 字族追加中文回退，末尾追加中文版样式微调 |
| `docs/assets/json/languages.json` | 语言列表加入「简体中文 / zh」 |

想只改译文不必重编译：编辑 `assets/strings/zh.json` 后，同步更新 `app.js` 里内嵌的那段 JSON 即可（或加 `?lang=zh` 走运行时加载）。
