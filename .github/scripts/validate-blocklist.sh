#!/bin/bash
set -e

# Validate Adblock Plus format blocklist
# Usage: ./validate-blocklist.sh <blocklist-file>

BLOCKLIST_FILE=${1:-block_url.txt}

# Check if file starts with [Adblock Plus]
if ! head -n 1 "$BLOCKLIST_FILE" | grep -q "^\[Adblock Plus"; then
  echo "❌ Error: File must start with [Adblock Plus] header"
  exit 1
fi

# Check for required metadata
if ! grep -q "^! Title:" "$BLOCKLIST_FILE"; then
  echo "⚠️ Warning: Missing Title metadata"
fi

if ! grep -q "^! Version:" "$BLOCKLIST_FILE"; then
  echo "❌ Error: Missing Version metadata"
  exit 1
fi

if ! grep -q "^! Homepage:" "$BLOCKLIST_FILE"; then
  echo "⚠️ Warning: Missing Homepage metadata"
fi

echo "✅ Blocklist format validation passed"
