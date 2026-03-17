# ai-chain

Pipes your question through **Gemini** (drafts an answer) → **Claude** (reviews and improves it).

Supports three modes, file input, stdin piping, and saving output.

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
ai-chain [--mode review|compare|debate] [--file <path>] [--save] [--quiet] "your question"
```

### Basic

```bash
ai-chain "what is a closure in JavaScript?"
```

Gemini answers first, then Claude reviews, confirms, or corrects it.

### Modes

| Mode | Behaviour |
|------|-----------|
| `review` *(default)* | Gemini answers, Claude reviews and corrects |
| `compare` | Both answer independently — output shown side by side, no cross-review |
| `debate` | Gemini answers → Claude challenges → Gemini has the final word |

```bash
ai-chain --mode compare "is TypeScript worth learning?"
ai-chain --mode debate "is Go better than Rust?"
```

### File input

Include a file's contents in the prompt:

```bash
ai-chain --file main.go "explain this code"
ai-chain --file package.json "are there any outdated or risky dependencies?"
```

### Stdin / pipe

```bash
cat script.sh | ai-chain "explain this script"
cat error.log | ai-chain "what went wrong?"
echo "what is a monad?" | ai-chain
```

### Save output

Write the full session to a timestamped Markdown file:

```bash
ai-chain --save "explain closures in JS"
# → ~/ai-chain-2026-03-17-143022.md
```

### Quiet mode

Suppress the `━━━ ... ━━━` banners:

```bash
ai-chain --quiet "what is TCP?"
```

## Model selection

The script auto-selects the Gemini model:

- **Flash** (`gemini-3.1-flash-lite-preview`) — short, simple lookups (≤ 8 words, simple pattern like "what is X")
- **Pro** (`gemini-3.1-pro-preview`) — everything else: long prompts, file input, piped stdin, `compare`/`debate` modes

## Examples

```bash
# Auto → Pro (complex question)
ai-chain "what is a monad in functional programming?"

# Auto → Flash (short, simple)
ai-chain "what is 2+2"

# Pipe a file
cat ~/.local/bin/ai-chain | ai-chain "explain this script"

# File flag
ai-chain --file ~/.local/bin/ai-chain "what does this do"

# Compare mode
ai-chain --mode compare "is TypeScript worth learning in 2025?"

# Debate mode
ai-chain --mode debate "is Go better than Rust?"

# Save output
ai-chain --save "explain closures in JS"
```
