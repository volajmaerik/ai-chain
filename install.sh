#!/bin/bash
set -e

# Install CLI script
mkdir -p ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/ai-chain \
  -o ~/.local/bin/ai-chain
chmod +x ~/.local/bin/ai-chain
echo "✓ Installed to ~/.local/bin/ai-chain"

# Install Claude Code slash command
mkdir -p ~/.claude/commands
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/commands/ai-chain.md \
  -o ~/.claude/commands/ai-chain.md
echo "✓ Installed /ai-chain slash command to ~/.claude/commands/ai-chain.md"

# Install cy-chain CLI
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/cy-chain \
  -o ~/.local/bin/cy-chain
chmod +x ~/.local/bin/cy-chain
echo "✓ Installed to ~/.local/bin/cy-chain"

# Install /cy-chain slash command
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/commands/cy-chain.md \
  -o ~/.claude/commands/cy-chain.md
echo "✓ Installed /cy-chain slash command to ~/.claude/commands/cy-chain.md"

echo "  Make sure ~/.local/bin is in your PATH."
