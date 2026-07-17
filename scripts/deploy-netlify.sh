#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Building Flutter web..."
flutter build web --release

echo "Deploying to Netlify..."
npx --yes netlify-cli deploy --prod --dir=build/web
