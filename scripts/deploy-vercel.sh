#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Building Flutter web..."
flutter build web --release

echo "Deploying to Vercel..."
export npm_config_cache="${npm_config_cache:-/tmp/npm-bella-cache}"
npx --yes vercel build/web --prod --yes
