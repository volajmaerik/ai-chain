# ai-chain

Pipes your question through **Gemini** (drafts an answer) → **Claude** (reviews and improves it).

## Prerequisites

- [Gemini CLI](https://github.com/google-gemini/gemini-cli) installed — run `gemini` once to authenticate
- [Claude Code](https://docs.anthropic.com/claude-code) installed — run `claude` once to authenticate
- `~/.local/bin` on your PATH — add this to `~/.zshrc` or `~/.bashrc` if needed:
  ```bash
  export PATH="$HOME/.local/bin:$PATH"
  ```

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/install.sh | bash
```

## Usage

```bash
ai-chain "your question here"
```

Example:

```bash
ai-chain "what is a closure in JavaScript?"
```

Gemini answers first, then Claude reviews, confirms, or corrects it.
