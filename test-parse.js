"use strict";
// Synthetic-buffer test for the .session parser (no real Serato needed).
const assert = require("assert");
const { parseSession } = require("./index.js");

function be32(n) { const b = Buffer.alloc(4); b.writeUInt32BE(n >>> 0, 0); return b; }
function utf16beBuf(s) { const b = Buffer.alloc(s.length * 2); for (let i = 0; i < s.length; i++) b.writeUInt16BE(s.charCodeAt(i), i * 2); return b; }
function field(id, valBuf) { return Buffer.concat([be32(id), be32(valBuf.length), valBuf]); }
function chunk(type, body) { return Buffer.concat([Buffer.from(type, "ascii"), be32(body.length), body]); }
function track(artist, title) {
  const adat = Buffer.concat([field(0x07, utf16beBuf(artist)), field(0x06, utf16beBuf(title))]);
  return chunk("oent", chunk("adat", adat));
}

const buf = Buffer.concat([
  chunk("vrsn", utf16beBuf("2.0/Serato ScratchLive Session")),
  track("deadmau5", "Strobe"),
  track("Eric Prydz", "Opus"),
  track("DJ MOTO MT", "Cardi UP ( Amapiano Style Edit )"),
]);

const tracks = parseSession(buf);
console.log("parsed", tracks.length, "tracks:");
tracks.forEach((t) => console.log("  -", t.artist, "/", t.title));

assert.strictEqual(tracks.length, 3, "should parse 3 oent entries");
assert.strictEqual(tracks[0].artist, "deadmau5");
assert.strictEqual(tracks[0].title, "Strobe");
assert.strictEqual(tracks[2].artist, "DJ MOTO MT");
assert.strictEqual(tracks[2].title, "Cardi UP ( Amapiano Style Edit )");
console.log("\nPASS — parser extracts artist/title and order (last = now playing)");
