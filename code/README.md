# Supplementary Code (Public Demo)

This folder contains a minimal, public-safe implementation that matches the core idea described in the paper:

**First-Seen–based behavioral snapshotting + lightweight risk scoring.**

## What this demo includes
- View history sampling (server-side, throttled)
- First-Seen snapshot generation:
  - angle delta to target
  - distance
  - angular velocity (estimated from recent view vectors)
  - smoothness score (stddev of micro-angle changes)
  - correction count (simple direction-flip heuristic)
  - estimated time-to-lock
- A small, transparent risk score (no bans / no kicks)

## What this demo does NOT include
- Private tuning rules, thresholds, weighting strategies
- Any enforcement logic (kick/ban)
- Remote code fetching / live dependency

## How to read it
- `FirstSeenDemo.lua`: the core demo module
- `ExampleServerHook.lua`: an example of how a visibility system could call `HandleFirstSeen`

## Intended use
This demo is for research reproducibility and engineering clarity.
For private implementations (tuning + integration), the logic should be adapted per-game (movement model, weapon model, camera controls, latency patterns, etc.).