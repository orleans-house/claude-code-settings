# CLAUDE.md

Use subagents:
- research
- plan
- implement

Handoff:
- research -> Create a GitHub Issue with research results (label: `research`). No code changes.
- plan -> Create a GitHub Issue with plan (label: `plan`). Add cross-reference to the related research Issue (e.g., `Related to #N`). No code changes.
- implement -> Approved GitHub Issue (label: `plan`) only.
- Parent review required before next step (research -> plan, plan -> implement).
- Write all GitHub Issues and comments in Japanese (日本語).

