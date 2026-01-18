# 👻 Ghost Token (GHOST / GHST)

**Version:** v1.0.0-alpha
**Status:** Authoritative Specification

Ghost is a **cross-chain token system** deployed on **Solana** and **Sui**, designed with a strict separation between **devnet testing** and **mainnet production**.

This repository contains **contracts, metadata, assets, and documentation** for both environments, with zero ambiguity and auditor-grade clarity.

---

## 🌐 What “Cross-Chain” Means

Ghost is **cross-chain by design**, not by bridge.

* ✅ Same token **identity**, **symbol**, and **branding** across chains
* ❌ No shared global supply (in v1.x)
* ❌ No automatic mint/burn parity

Each chain hosts a **native deployment** with **chain-specific parameters** (decimals, max supply, standards).

This model is used by established assets such as **USDC**, **USDT**, and **WETH**.

---

## 🧪 Devnet vs Mainnet

### Devnet (Testing Only)

| Chain         | Token | Purpose           |
| ------------- | ----- | ----------------- |
| Solana Devnet | GHST  | Faucet test token |
| Sui Devnet    | GHST  | Faucet test token |

**GHST** is:

* Devnet-only
* Never bridged
* Never deployed to mainnet
* Has **no monetary or market value**

---

### Mainnet (Production)

| Chain          | Token       | Symbol |
| -------------- | ----------- | ------ |
| Solana Mainnet | Ghost Token | GHOST  |
| Sui Mainnet    | Ghost Token | GHOST  |

Mainnet tokens:

* Have fixed max supply per chain
* Have **no faucet**
* Are production assets

---

## 🪙 Token Parameters

### GHOST — Solana Mainnet

| Field      | Value          |
| ---------- | -------------- |
| Symbol     | GHOST          |
| Decimals   | 9              |
| Max Supply | 18,446,000,000 |
| Standard   | SPL Token-2022 |
| Faucet     | ❌ Disabled     |

---

### GHOST — Sui Mainnet

| Field      | Value          |
| ---------- | -------------- |
| Symbol     | GHOST          |
| Decimals   | 18             |
| Max Supply | 20,000,000,000 |
| Faucet     | ❌ Disabled     |

> ⚠️ Same symbol ≠ same decimals
> ⚠️ Same symbol ≠ shared ledger

---

## 🚰 Faucets (Devnet Only)

### GHST Faucet Rules

| Chain         | Claim Amount | Decimals | Availability |
| ------------- | ------------ | -------- | ------------ |
| Solana Devnet | 5,000 GHST   | 9        | ✅            |
| Sui Devnet    | 5,000 GHST   | 18       | ✅            |

* Open to developers, users, and testers
* Cooldowns and rate limits apply
* **No faucet exists on mainnet**

---

## 🔒 Supply Model

### Current Model (v1.x)

* Independent max supply per chain
* No automatic mint/burn parity
* No bridge required

This model is:

* ✅ Safe
* ✅ Auditable
* ✅ Exchange-friendly

---

### Future Model (v2+, Optional)

A future hard-parity bridge would require:

* Canonical mint chain
* Lock/burn on source
* Mint on destination
* Strict supply accounting
* Third-party audits

🚫 **Not part of v1.0.0-alpha**

---

## 📁 Repository Structure

```
ghost-token/
├── assets/            # Token icons (SVG, PNG)
├── metadata/          # Chain + network specific metadata
├── sui/               # Sui Move packages
│   ├── devnet/
│   └── mainnet/
├── solana/            # Solana configs & programs
│   ├── devnet/
│   └── mainnet/
├── docs/              # Specifications & explanations
├── scripts/           # Deployment helpers
└── README.md
```

Each directory is **explicitly scoped**:

* GHST vs GHOST
* Devnet vs Mainnet
* Sui vs Solana

No files are shared across environments where that could cause risk.

---

## ⚠️ Devnet Disclaimer (Mandatory)

**GHST is a devnet-only test token.**

It has **no monetary value**, **no market value**, and **no guarantee of conversion** to mainnet GHOST.

GHST exists strictly for:

* Development
* Testing
* Demonstration

---

## 📊 Final Token Matrix

| Token | Chain  | Network | Decimals | Max Supply |
| ----- | ------ | ------- | -------- | ---------- |
| GHST  | Solana | Devnet  | 9        | Test only  |
| GHST  | Sui    | Devnet  | 18       | Test only  |
| GHOST | Solana | Mainnet | 9        | 18.446B    |
| GHOST | Sui    | Mainnet | 18       | 20.0B      |

---

## 📎 Links

* Token Icon: `assets/GHOST.svg`
* Solana Program: **GhostFaucet** (Devnet)
* Sui Module: **GhostFaucet** (Devnet)
* Documentation: Coming soon

---

© 2026 Ghost Protocol
