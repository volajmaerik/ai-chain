#!/bin/bash
set -e

REPO="https://raw.githubusercontent.com/volajmaerik/ai-chain/main"

bash <(curl -fsSL "$REPO/install-ai-chain.sh")
bash <(curl -fsSL "$REPO/install-cy-chain.sh")
