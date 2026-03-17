If "$ARGUMENTS" is empty, reply with the following help text exactly and stop:

```
Usage: /ai-chain <your question>

Flags (pass as part of your question):
  --mode compare    Both AIs answer independently, shown side by side
  --mode debate     Gemini answers → Claude challenges → Gemini has final word
  --ensemble        Run 3 parallel Gemini perspectives, Claude synthesizes
  --ensemble <N>    Run N perspectives (1–5, default 3)
  --file <path>     Include a file's contents in the prompt
  --save            Save output to ~/ai-chain-YYYY-MM-DD-HHMMSS.md
  --quiet           Suppress ━━━ banners

Examples:
  /ai-chain what is a closure in JavaScript?
  /ai-chain --ensemble explain monads
  /ai-chain --ensemble 5 is Rust worth learning?
  /ai-chain --mode debate is Go better than Rust?
  /ai-chain --mode compare what is eventual consistency?
  /ai-chain --file main.go explain this code
  /ai-chain --save --ensemble what is a monad?

Note: /ai-chain runs a single Gemini + Claude review inline.
For full flag support (--file, --save, --ensemble, etc.), use the CLI: ai-chain "..."
```

Otherwise, run the following bash command and capture its output:

```bash
gemini -m auto-gemini-3 -p "$ARGUMENTS"
```

Once you have Gemini's response, review it:
- If it's correct and complete, confirm it briefly and add anything useful.
- If there are errors, gaps, or improvements — fix them and explain what changed.

Be concise.

---

For more features (modes, file input, save), use the CLI directly:
- `ai-chain --mode compare "..."` — both AIs answer independently
- `ai-chain --mode debate "..."` — Gemini answers, Claude challenges, Gemini replies
- `ai-chain --ensemble "..."` — 3 parallel Gemini perspectives, Claude synthesizes
- `ai-chain --ensemble 5 "..."` — 5 parallel perspectives (max)
- `ai-chain --file <path> "..."` — include a file in the prompt
- `ai-chain --save "..."` — save output to ~/ai-chain-YYYY-MM-DD-HHMMSS.md
- `cat file.py | ai-chain "explain this"`
