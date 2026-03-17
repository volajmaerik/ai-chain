#!/bin/bash
set -e
mkdir -p ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/volajmaerik/ai-chain/main/ai-chain \
  -o ~/.local/bin/ai-chain
chmod +x ~/.local/bin/ai-chain
echo "✓ Installed to ~/.local/bin/ai-chain"
echo "  Make sure ~/.local/bin is in your PATH."
