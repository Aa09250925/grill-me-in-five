# grill-me-in-five

iOS Club 第三堂課用的 Skill：告訴 Agent 要加什麼功能，它會先問你五個問題，把細節問清楚、整理成計畫，你同意了才動手。

Codex 和 Antigravity 都能用。

## 下載（請 Agent 幫你放）

在 Codex 或 Antigravity 選好你的專案，輸入：

> 幫我把 github.com/Aa09250925/grill-me-in-five 裡的 grill-me-in-five 資料夾，下載到這個專案根目錄的 .agents/skills/ 裡

Codex 預設不能寫進 `.agents` 資料夾，會跳出來要權限，按「允許」就好。

### 自己下載（備案）

1. 在這一頁點綠色的「Code」按鈕，選「Download ZIP」。
2. 打開下載的 ZIP，會得到一個 `grill-me-in-five-main` 資料夾。要用的是**裡面**那個 `grill-me-in-five` 資料夾，不是外面這個。
3. 把它拖進專案根目錄的 `.agents/skills/` 裡（見下面）。

## 放好的樣子

不管哪一種方法，最後都要長這樣：

```text
TodoApp/
└── .agents/
    └── skills/
        └── grill-me-in-five/
            ├── SKILL.md
            ├── scripts/
            │   ├── scan.sh
            │   └── build.sh
            └── references/
                └── questions.md
```

- `.agents` 開頭有一個點，Finder 平常看不到。在 Finder 按 `⌘ ⇧ .`（Command + Shift + 句點）就能顯示隱藏檔案。
- 如果專案裡還沒有 `.agents` 和 `skills` 資料夾，就自己建一個，名字要一模一樣。
- 資料夾名字要維持 `grill-me-in-five`，不要改。

## 裡面有什麼

| 檔案 | 做什麼 |
| --- | --- |
| `SKILL.md` | 一定要有。開頭寫 name 和 description，下面寫做法：先看懂專案、問五個問題、整理成計畫、實作、回報 |
| `scripts/scan.sh` | Agent 執行的小程式：列出專案有哪些畫面、存了哪些資料 |
| `scripts/build.sh` | Agent 執行的小程式：改完自動編譯，只印出錯誤 |
| `references/questions.md` | 參考資料：怎麼問好問題、問題格式和例子，要問問題時 Agent 才會讀 |

`scripts` 和 `references` 都是 Agent 自己會用的，你不用打開它們。

## 使用

- **Codex**：在輸入框打 `$grill-me-in-five`，或到「自訂 → 技能」確認它出現在你的專案分頁。
- **Antigravity**：選好專案後，在輸入框打 `/grill-me-in-five`。如果清單裡找不到，把 Antigravity 關掉再打開一次。

接著告訴它要加什麼功能，例如：

> 我現在專案根目錄有一個 skill，請根據這個 skill，幫 To-Do App 加上「完成紀錄」

然後認真回答它問的五個問題，不要只回「都可以」。
