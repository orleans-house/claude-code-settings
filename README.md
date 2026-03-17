# claude-code-settings

Claude Code のグローバル設定を管理するリポジトリ。

## セットアップ

```bash
git clone <repository-url>
cd claude-code-settings
./setup.sh    # ~/.claude/ にシンボリックリンクを作成
./clean.sh    # シンボリックリンクを削除
```

## 構成

| パス | 役割 |
|------|------|
| `settings.json` | パーミッション、フックなどの本体設定 |
| `rules/` | グローバルに適用されるルール |
| `agents/` | サブエージェント定義 |
| `skills/` | スラッシュコマンド定義 |
| `output-styles/` | 出力スタイル定義 |
| `CLAUDE.md` | このリポジトリ自体の設定 |

## CLAUDE.md について

**CLAUDE.md はグローバルに設定するものではなく、各プロジェクトに配置すべきもの。**

このリポジトリの `CLAUDE.md` はあくまで本リポジトリ自体を編集する際のルールであり、グローバルなプロジェクトメモリとしては使用しない。プロジェクト横断のルールは `rules/` に定義する。

## ライセンス

MIT
