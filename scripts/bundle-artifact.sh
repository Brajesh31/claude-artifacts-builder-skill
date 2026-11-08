#!/usr/bin/env bash
set -euo pipefail

root="${1:-.}"
root="$(cd "$root" && pwd)"
index="$root/index.html"
entry="$root/src/main.jsx"
out="$root/dist/artifact.html"

if [[ ! -f "$index" || ! -f "$entry" ]]; then
  echo "Expected index.html and src/main.jsx under: $root" >&2
  exit 1
fi
if ! command -v npx >/dev/null 2>&1; then
  echo "Node.js and npm (npx) are required." >&2
  exit 1
fi

mkdir -p "$root/dist"
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
(
  cd "$root"
  npx --yes esbuild src/main.jsx --bundle --minify --outfile="$tmp"
)

python3 - "$index" "$tmp" "$out" <<'PY'
from pathlib import Path
import sys

html_path, js_path, output_path = map(Path, sys.argv[1:])
html = html_path.read_text(encoding="utf-8")
js = js_path.read_text(encoding="utf-8")
script_tag = '<script src="./dist/app.js"></script>'
inline_tag = '<script>\n' + js + '\n</script>'

if script_tag not in html:
    raise SystemExit(f"Could not find expected script tag: {script_tag}")
result = html.replace(script_tag, inline_tag, 1)
output_path.write_text(result, encoding="utf-8")
print(f"Wrote single-file artifact: {output_path}")
PY
