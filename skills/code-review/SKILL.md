---
name: code-review
description: Code review a pull request
user_invocable: true
---

Code review a pull request using parallel subagents.

## Input

- PR number is passed as an argument (e.g. `/code-review 42`).
- If no argument, detect the current branch's PR with `gh pr view --json number -q .number`.

Store the PR number as `$PR` for use in agent prompts.

## Phase 1 — Parallel Analysis

Launch the following 4 agents in parallel using the Agent tool. Each agent writes its output to a temp file.

1. **review-repo** agent — `"Review PR #$PR: repository-level architecture review. Write output to /tmp/review-repo-PR$PR.md"`
2. **review-files** agent — `"Review PR #$PR: per-file bug and logic review. Write output to /tmp/review-files-PR$PR.md"`
3. **review-docs** agent — `"Review PR #$PR: documentation consistency review. Write output to /tmp/review-docs-PR$PR.md"`
4. **review-codex** agent — `"Review PR #$PR: codex CLI analysis. Write output to /tmp/review-codex-PR$PR.md"`

Wait for all 4 agents to complete.

## Phase 2 — Summary

Launch the **review-summary** agent:
- `"Summarize review results for PR #$PR from /tmp/review-*-PR$PR.md and post a PR comment."`

## Error Handling

- If any Phase 1 agent fails, proceed with available results.
- If review-codex fails (codex not installed), skip it silently.
