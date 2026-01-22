# Sui Move Sources

This directory contains all **on-chain Move modules** for the Ghost Network on Sui. It is intentionally structured to separate **canonical mainnet assets**, **test-only assets**, **governance**, and **bridge safety logic**.

> **Important:** Only the `ghost/` package is intended for **mainnet deployment**. The `ghst/` package is **strictly devnet/testnet** and contains compile-time guards preventing mainnet publish.

---

## 📁 Directory Structure

```
sources/
├── ghost/                # Canonical GHOST token (MAINNET)
│   ├── ghost_token.move
│   ├── treasury.move
│   ├── metadata.move
│   └── specs/            # Move Prover specifications
│
├── dao/                  # DAO governance & timelock
│   ├── dao.move
│   ├── voting.move
│   ├── timelock.move
│   └── specs/
│
├── bridge/               # Sui-side bridge vault (lock/burn)
│   ├── vault.move
│   ├── events.move
│   └── specs/
│
├── ghst/                 # GHST test token (DEVNET / TESTNET ONLY)
│   ├── ghst_token.move
│   ├── deny_bridge.move
│   └── tests/
│
└── utils/                # Shared helpers
    └── errors.move
```

---

## 🪙 GHOST (Canonical Token)

* **Symbol:** GHOST
* **Total Supply:** 20,000,000,000 (fixed)
* **Decimals:** 9
* **Chain:** Sui (canonical)
* **Mint Authority:** DAO-controlled TreasuryCap

### Key Guarantees

* Supply cap enforced at Move level
* TreasuryCap uniqueness invariant
* Metadata frozen post-deploy
* Upgradeable only via DAO timelock

---

## 🧪 GHST (Test Token)

* **Purpose:** Development, testing, experimentation
* **Networks:** Devnet / Testnet only
* **Mainnet:** ❌ Explicitly forbidden

### Safety Controls

* Compile-time guard blocking mainnet publish
* Bridge-deny hook prevents cross-chain use
* Excluded from all economic accounting

---

## 🗳️ DAO & Governance

The DAO modules manage:

* TreasuryCap custody
* Token minting/burning
* Metadata upgrades
* Bridge pause / relayer rotation

All privileged actions:

1. Require DAO proposal
2. Pass quorum voting
3. Are subject to a timelock delay

---

## 🌉 Bridge (Sui Side)

The bridge vault locks canonical GHOST and emits events consumed by off-chain relayers.

### Invariants

* Locked GHOST + wrapped GHOST = constant supply
* Nonce monotonicity (no replay)
* Unlock requires verified burn proof

GHST is **explicitly excluded** from bridging.

---

## 📐 Formal Verification

Each critical module has an accompanying `specs/` directory containing:

* Supply invariants
* Authority constraints
* Nonce monotonicity proofs

These specs are enforced in CI via **Move Prover (SMT-backed)**.

---

## 🚫 What Is NOT Here

* No frontend code
* No relayer logic
* No Solana programs

Those live in separate directories or repositories.

---

## ✅ Deployment Policy Summary

| Module     | Network         |
| ---------- | --------------- |
| `ghost/*`  | Mainnet ✔       |
| `dao/*`    | Mainnet ✔       |
| `bridge/*` | Mainnet ✔       |
| `ghst/*`   | Dev/Test only ❌ |

---

## 🧾 Auditor Note

> The separation between canonical assets, test assets, governance, and bridge logic is deliberate and designed to reduce blast radius, simplify audits, and enforce supply invariants at the type system level.

