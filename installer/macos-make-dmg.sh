#!/bin/bash
# Build a drag-to-install .dmg for macOS containing the helper (both arm64 + x64
# binaries) and a double-clickable launcher. Run on a macOS runner in CI.
# UNSIGNED — the user right-clicks -> Open the first time.
set -euo pipefail
cd "$(dirname "$0")/.."   # -> tools/serato-helper

STAGE="dist/dmgroot/Speakeasy Serato Helper"
rm -rf dist/dmgroot
mkdir -p "$STAGE"

cp dist/speakeasy-helper-arm64 "$STAGE/speakeasy-helper-arm64"
cp dist/speakeasy-helper-x64   "$STAGE/speakeasy-helper-x64"
cp README.md "$STAGE/README.md"

# Arch-detecting launcher the user double-clicks (opens Terminal, runs the helper).
cat > "$STAGE/Start Speakeasy Helper.command" <<'EOF'
#!/bin/bash
cd "$(dirname "$0")"
if [ "$(uname -m)" = "arm64" ]; then BIN=./speakeasy-helper-arm64; else BIN=./speakeasy-helper-x64; fi
chmod +x "$BIN" 2>/dev/null || true
"$BIN"
EOF
chmod +x "$STAGE/Start Speakeasy Helper.command"

hdiutil create -volname "Speakeasy Serato Helper" -srcfolder dist/dmgroot -ov -format UDZO dist/SpeakeasyHelper.dmg
echo "Built dist/SpeakeasyHelper.dmg"
