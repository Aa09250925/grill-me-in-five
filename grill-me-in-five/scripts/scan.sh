#!/bin/bash
# 快速列出專案有哪些畫面、哪些資料，給「看懂專案」和第 4 題用。
# 用法：bash scripts/scan.sh <專案根目錄>
# 只讀檔案，不會改任何東西。

ROOT="${1:-.}"
EXCLUDE="--exclude-dir=.git --exclude-dir=.agents --exclude-dir=build --exclude-dir=DerivedData"

echo "== Swift 檔案 =="
find "$ROOT" -name "*.swift" -not -path "*/.*/*" -not -path "*/build/*" | sed "s|^$ROOT/||" | sort
echo

echo "== 畫面（View）=="
grep -rhoE $EXCLUDE --include="*.swift" "struct [A-Za-z0-9_]+ *: *View" "$ROOT" \
    | sed -E "s/struct ([A-Za-z0-9_]+).*/\1/" | sort -u
echo

echo "== 資料型別（struct／class）=="
grep -rnE $EXCLUDE --include="*.swift" "^(@Model)?[[:space:]]*(final )?(struct|class) [A-Za-z0-9_]+[^{]*(Identifiable|Codable|Hashable|@Model)|^@Model" "$ROOT" \
    | sed "s|^$ROOT/||"
echo

echo "== 存資料的地方（@State、@AppStorage、@Query、SwiftData…）=="
grep -rnE $EXCLUDE --include="*.swift" "@(State|AppStorage|SceneStorage|Query|Published|Observable|Model)\b" "$ROOT" \
    | sed "s|^$ROOT/||"
echo

echo "== 每筆資料記了哪些欄位 =="
grep -rnE $EXCLUDE --include="*.swift" "^[[:space:]]+(let|var) [a-zA-Z_][A-Za-z0-9_]* *(:[^=]+|= *(\"|[0-9]|true|false|Date\\(|UUID\\(|\\[))" "$ROOT" \
    | grep -vE "var body|@|\{ *$|->" | sed "s|^$ROOT/||"
