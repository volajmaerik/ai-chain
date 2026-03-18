#!/bin/bash
set -e

mkdir -p ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/ai-chain \
  -o ~/.local/bin/ai-chain
chmod +x ~/.local/bin/ai-chain
echo "✓ Installed to ~/.local/bin/ai-chain"

mkdir -p ~/.claude/commands
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/commands/ai-chain.md \
  -o ~/.claude/commands/ai-chain.md
echo "✓ Installed /ai-chain slash command to ~/.claude/commands/ai-chain.md"

echo "  Make sure ~/.local/bin is in your PATH."
