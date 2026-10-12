#!/bin/bash
# 編譯 iOS 專案（給模擬器），只印出錯誤和結果。
# 用法：bash scripts/build.sh <專案根目錄>
# 專案根目錄就是放 .xcodeproj 的那一層；沒給就用目前所在的資料夾。

ROOT="${1:-.}"

PROJ=$(find "$ROOT" -maxdepth 2 -name "*.xcodeproj" -not -path "*/.*/*" | head -n 1)
if [ -z "$PROJ" ]; then
    echo "找不到 .xcodeproj，請確認專案根目錄：$ROOT"
    exit 1
fi

# 用專案裡的第一個 scheme；找不到就用專案名稱
SCHEME=$(xcodebuild -list -project "$PROJ" 2>/dev/null | awk '/Schemes:/{f=1; next} f && NF {gsub(/^ +/, ""); print; exit}')
[ -z "$SCHEME" ] && SCHEME=$(basename "$PROJ" .xcodeproj)

LOG=$(mktemp)
xcodebuild -project "$PROJ" -scheme "$SCHEME" \
    -destination "generic/platform=iOS Simulator" \
    CODE_SIGNING_ALLOWED=NO -quiet build > "$LOG" 2>&1
STATUS=$?

if [ $STATUS -eq 0 ]; then
    echo "BUILD SUCCEEDED（$SCHEME）"
elif grep -qE "Operation not permitted|workspace arena|produced malformed response" "$LOG"; then
    # Agent 的沙盒擋住了 xcodebuild，不是程式寫錯
    echo "BUILD FAILED（$SCHEME）"
    echo "權限不夠：沙盒擋住了 xcodebuild，不是程式寫錯。請向使用者要求執行權限後再跑一次。"
else
    echo "BUILD FAILED（$SCHEME）"
    # 只留程式碼錯誤（檔名:行:欄: error: 說明），去掉重複，最多 20 行
    ERRORS=$(grep -E "\.swift:[0-9]+:[0-9]+: error:" "$LOG" \
        | sed -E "s|^.*/([^/]+\.swift:[0-9]+:[0-9]+: error:)|\1|" | sort -u | head -n 20)
    if [ -n "$ERRORS" ]; then
        echo "$ERRORS"
    else
        echo "--- 最後幾行紀錄 ---"
        tail -n 8 "$LOG"
    fi
fi
rm -f "$LOG"
exit $STATUS
