#!/bin/bash

SITES=("https://www.google.com" "https://github.com" "https://site-que-nao-existe-123.com")

for SITE in "${SITES[@]}"; do
  STATUS=$(curl -o /dev/null -s -w "%{http_code}" --max-time 5 "$SITE")

  if [ "$STATUS" -eq 200 ]; then
    echo "✅ $SITE está no ar! Status: $STATUS"
  else
    echo "❌ $SITE com problema! Status: $STATUS"
  fi
done
