#!/bin/bash
# One-off: make the repo public and enable GitHub Pages (branch main / root).
set -e
REPO="carlosxh07/liquibot-dashboard-mockup"
T=$(printf 'protocol=https\nhost=github.com\n\n' | git credential fill 2>/dev/null | sed -n 's/^password=//p')
if [ -z "$T" ]; then echo "No GitHub token found in git credential store."; exit 1; fi

echo "1) make public"
curl -sS -X PATCH -H "Authorization: Bearer $T" -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/$REPO" -d '{"private":false}' \
  -o /dev/null -w '   http %{http_code}\n'

echo "2) enable Pages"
curl -sS -X POST -H "Authorization: Bearer $T" -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/$REPO/pages" -d '{"source":{"branch":"main","path":"/"}}' \
  -w '\n   http %{http_code}\n'

echo "3) Pages status"
curl -sS -H "Authorization: Bearer $T" -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/$REPO/pages" \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print('   status:', d.get('status'), '| url:', d.get('html_url'))"

echo
echo "Live in ~1-2 min: https://carlosxh07.github.io/liquibot-dashboard-mockup/"
