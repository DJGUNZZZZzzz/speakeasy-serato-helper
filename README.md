# SPEAKEASY · Serato Helper

Pushes the track you're **currently playing in Serato** straight to THE CRATE —
faster than the web scrape, and without a Serato account or Live Playlists. It
only **reads** Serato's history files; it never changes your library.

## Install (easiest — no Node needed)

Download the installer for your computer (THE CRATE → ⚙ Settings → Now Playing →
Speakeasy Helper):

- **Windows:** `SpeakeasyHelper-Setup.exe` → run it (one-time SmartScreen:
  "More info" → "Run anyway", because it isn't code-signed yet).
- **macOS:** open `SpeakeasyHelper.dmg`, **drag the "Speakeasy Serato Helper"
  folder onto your Desktop** (don't run it straight from the disk image — it stops
  when the image ejects), then **right-click → Open** on **`Start Speakeasy
  Helper.command`** the first time. That one-time Gatekeeper prompt is the only
  click you need — the launcher then clears the "unsigned" warning for the rest of
  the folder itself.

The Terminal window that opens should read **`v0.2.1`** at the top (that's how you
confirm you're on the current build). **Leave that window open while you DJ.**

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

## Uninstall

- **Windows:** Settings → Apps → **Speakeasy Serato Helper** → Uninstall.
- **macOS:** quit it (**Control-C** in its Terminal window, then close it), drag the
  **Speakeasy Serato Helper** folder to the Trash, and remove the saved pairing at
  `~/.speakeasy-helper` (Finder → Go → Go to Folder… → `~/.speakeasy-helper`).
