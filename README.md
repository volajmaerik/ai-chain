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
ai-chain [--mode review|compare|debate] [--ensemble [N]] [--file <path>] [--save] [--quiet] "your question"
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

### Ensemble mode

Run N Gemini calls in parallel, each approaching the question from a different angle, then Claude synthesizes all perspectives into one authoritative answer.

```bash
ai-chain --ensemble "what is a monad in functional programming?"    # 3 perspectives (default)
ai-chain --ensemble 5 "is Rust worth learning?"                     # 5 perspectives
ai-chain --ensemble --file main.go "review this code"               # with file input
ai-chain --ensemble --save "what is eventual consistency?"          # save output
```

N defaults to 3, max is 5. Only works in `review` mode — combining with `--mode debate` or `--mode compare` prints a warning and falls back to single Gemini.

The 5 lenses used (N controls how many are active, always starting from 1):

| # | Lens | Approach |
|---|------|----------|
| 1 | Direct | Precise and technically accurate |
| 2 | Reasoning | Step-by-step reasoning process |
| 3 | Critical | Edge cases and common misconceptions |
| 4 | Practical | Concrete examples |
| 5 | Expert | Deep domain expertise, precise terminology |

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

## Model

Uses `auto-gemini-3` — Google automatically routes each request to the best Gemini 3.1 model.

## Examples

```bash
# Basic question
ai-chain "what is a monad in functional programming?"

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

# Ensemble: 3 parallel perspectives, Claude synthesizes
ai-chain --ensemble "explain async/await in JavaScript"

# Ensemble with 5 perspectives
ai-chain --ensemble 5 "explain async/await in JavaScript"
```
