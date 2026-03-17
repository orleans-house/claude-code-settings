# claude-code-settings

Claude Code のグローバル設定を管理するリポジトリ。

## Setup

```bash
git clone <repository-url>
cd claude-code-settings
./setup.sh
```

## Cleanup

```bash
./clean.sh
```

## CLAUDE.md について

**CLAUDE.md はグローバルに設定するものではなく、各プロジェクトに配置すべきもの。**

このリポジトリの `CLAUDE.md` はあくまで本リポジトリ自体を編集する際のルールであり、グローバルなプロジェクトメモリとしては使用しない。プロジェクト横断のルールは `rules/` に定義する。
