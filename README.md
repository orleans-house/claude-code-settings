# claude-code-settings

Claude Codeのグローバル設定リポジトリ。

## セットアップ

```bash
git clone <repository-url>
cd claude-code-settings
./setup.sh
```

`~/.claude/` 配下にシンボリックリンクが作成されます。

## 設計方針

### 何をどこに定義するか

| 定義場所 | 注入方式 | 用途 |
|---------|---------|------|
| `~/.claude/output-styles/` | システムプロンプト | ワークフロー定義 |
| `settings.json` の `hooks` | ライフサイクルフック | Formatter・Linter の自動実行 |
| `.claude/rules/` | ユーザーコンテキスト（パス制限可） | プロジェクト固有のルール、Lint・テストの実行手順、禁止行動、アーキテクチャ上の制約 |

## ライセンス

MIT
