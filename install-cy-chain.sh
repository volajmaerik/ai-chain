#!/bin/bash
set -e

mkdir -p ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/cy-chain \
  -o ~/.local/bin/cy-chain
chmod +x ~/.local/bin/cy-chain
echo "✓ Installed to ~/.local/bin/cy-chain"

mkdir -p ~/.claude/commands
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/commands/cy-chain.md \
  -o ~/.claude/commands/cy-chain.md
echo "✓ Installed /cy-chain slash command to ~/.claude/commands/cy-chain.md"

echo "  Make sure ~/.local/bin is in your PATH."
