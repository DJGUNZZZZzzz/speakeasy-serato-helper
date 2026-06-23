# SPEAKEASY · Serato Helper

Pushes the track you're **currently playing in Serato** straight to THE CRATE —
faster than the web scrape, and without a Serato account or Live Playlists. It
only **reads** Serato's history files; it never changes your library.

## Install (easiest — no Node needed)

Download the installer for your computer (THE CRATE → ⚙ Settings → Now Playing →
Speakeasy Helper):

- **Windows:** `SpeakeasyHelper-Setup.exe` → run it (one-time SmartScreen:
  "More info" → "Run anyway", because it isn't code-signed yet).
- **macOS:** `SpeakeasyHelper.dmg` → open it, then **right-click "Start Speakeasy
  Helper" → Open** the first time (one-time Gatekeeper prompt).

Then: THE CRATE → ⚙ → Now Playing → Speakeasy Helper → **Generate pairing code**,
and paste it into the helper when it asks (one time — it remembers).

## Run from source (advanced — no installer)

1. Install **Node.js** (free): https://nodejs.org (LTS).
2. From this folder: `node index.js`
3. Paste your pairing code when asked.

## Notes

- **Read-only & private:** only reads `…/Music/_Serato_/History`. No writes.
- Config is saved to `~/.speakeasy-helper/config.json`.
- **Library on another drive?** Set `"seratoPath"` in that config file.
- **Lag:** Serato logs a track a little after you bring it in — that's Serato's
  behavior, not the helper.
- Stop any time with **Ctrl+C** (or just close the window).
