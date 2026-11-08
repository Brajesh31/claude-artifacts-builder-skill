#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <project-name>" >&2
  exit 2
fi

name="$1"
if [[ ! "$name" =~ ^[a-zA-Z0-9][a-zA-Z0-9._-]*$ ]]; then
  echo "Project name may contain letters, numbers, dot, underscore, and hyphen." >&2
  exit 2
fi
if [[ -e "$name" ]]; then
  echo "Refusing to overwrite existing path: $name" >&2
  exit 1
fi

mkdir -p "$name/src"
cat > "$name/package.json" <<EOF
{
  "name": "$name",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "build": "esbuild src/main.jsx --bundle --minify --outfile=dist/app.js"
  },
  "devDependencies": {
    "esbuild": "^0.25.0"
  }
}
EOF
cat > "$name/index.html" <<'EOF'
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Artifact</title>
</head>
<body>
  <main id="app"></main>
  <script src="./dist/app.js"></script>
</body>
</html>
EOF
cat > "$name/src/main.jsx" <<'EOF'
const root = document.querySelector("#app");
root.innerHTML = "<h1>Hello, artifact</h1><p>Replace this starter with your experience.</p>";
EOF
cat > "$name/.gitignore" <<'EOF'
node_modules/
dist/
EOF
cat > "$name/README.md" <<EOF
# $name

A small self-contained web artifact.

## Build

```bash
npm install
npm run build
```

Open `index.html` after building. For a single-file deliverable, run the bundler script from the skill repository.
EOF

echo "Created $name"
