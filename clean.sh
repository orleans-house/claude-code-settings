#!/bin/bash

set -e

# 色の定義
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 設定ファイルとディレクトリのパス
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.claude"

echo "Claude Code設定のクリーンアップを開始します..."
echo ""

# シンボリックリンクを削除する関数
remove_symlink() {
    local SOURCE="$1"
    local TARGET="$2"
    local NAME="$3"

    # ターゲットが存在しない場合はスキップ
    if [ ! -e "${TARGET}" ] && [ ! -L "${TARGET}" ]; then
        echo -e "${YELLOW}⊘ ${NAME}: 存在しません（スキップ）${NC}"
        return 0
    fi

    # シンボリックリンクでない場合はスキップ
    if [ ! -L "${TARGET}" ]; then
        echo -e "${YELLOW}⊘ ${NAME}: シンボリックリンクではありません（スキップ）${NC}"
        return 0
    fi

    # このリポジトリへのシンボリックリンクか確認
    LINK_TARGET=$(readlink "${TARGET}")
    if [ "${LINK_TARGET}" != "${SOURCE}" ]; then
        echo -e "${YELLOW}⊘ ${NAME}: このリポジトリへのリンクではありません（スキップ）${NC}"
        return 0
    fi

    # シンボリックリンクを削除
    rm "${TARGET}"
    echo -e "${GREEN}✓ ${NAME}: シンボリックリンクを削除しました${NC}"
}

# クリーンアップ対象のリスト
echo "シンボリックリンクを削除しています..."
echo ""

# settings.json
remove_symlink "${SCRIPT_DIR}/settings.json" "${TARGET_DIR}/settings.json" "settings.json"

# agents/
remove_symlink "${SCRIPT_DIR}/agents" "${TARGET_DIR}/agents" "agents/"

# skills/
remove_symlink "${SCRIPT_DIR}/skills" "${TARGET_DIR}/skills" "skills/"

# commands/
remove_symlink "${SCRIPT_DIR}/commands" "${TARGET_DIR}/commands" "commands/"

# hooks/
remove_symlink "${SCRIPT_DIR}/hooks" "${TARGET_DIR}/hooks" "hooks/"

# rules/
remove_symlink "${SCRIPT_DIR}/rules" "${TARGET_DIR}/rules" "rules/"

# output-styles/
remove_symlink "${SCRIPT_DIR}/output-styles" "${TARGET_DIR}/output-styles" "output-styles/"

# 完了メッセージ
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✓ クリーンアップが完了しました！${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "再度セットアップする場合は ./setup.sh を実行してください。"
