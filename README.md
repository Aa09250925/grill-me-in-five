# grill-me-in-five

iOS Club 第三堂課用的 Skill：幫 App 加新功能之前，Agent 會先問你五個問題，再根據你的回答，做出一個你原本沒想到的功能。

Codex 和 Antigravity 都能用。

## 下載

1. 在這一頁點綠色的「Code」按鈕，選「Download ZIP」。
2. 打開下載的 ZIP，裡面有一個 `grill-me-in-five` 資料夾。

## 放進專案

把 `grill-me-in-five` 整個資料夾，放到你專案根目錄的 `.agents/skills/` 裡：

```text
TodoApp/
└── .agents/
    └── skills/
        └── grill-me-in-five/
            └── SKILL.md
```

- `.agents` 開頭有一個點，Finder 平常看不到。在 Finder 按 `⌘ ⇧ .`（Command + Shift + 句點）就能顯示隱藏檔案。
- 如果專案裡還沒有 `.agents` 和 `skills` 資料夾，就自己建一個，名字要一模一樣。
- 資料夾名字要維持 `grill-me-in-five`，不要改。

## 使用

- **Codex**：在輸入框打 `$grill-me-in-five`，或到「自訂 → 技能」確認它出現在你的專案分頁。
- **Antigravity**：選好專案後，在輸入框打 `/grill-me-in-five`。如果清單裡找不到，把 Antigravity 關掉再打開一次。

接著告訴它你想幫 App 加新功能，例如：

> 我現在專案根目錄有一個 skill，請根據這個 skill，幫 To-Do App 加一個新功能

然後認真回答它問的五個問題。
