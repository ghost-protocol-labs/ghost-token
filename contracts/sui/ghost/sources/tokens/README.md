# GHST — Ghost Test Token (Sui)

**GHST is a test-only token for development and experimentation.**  
It has **no value**, **no governance role**, and **no relationship** to the GHOST mainnet token.

---

## ⚠️ IMPORTANT DISCLAIMER

> **GHST IS NOT GHOST.**

- ❌ Not a mainnet token  
- ❌ Not transferable to production systems  
- ❌ Not bridged  
- ❌ Not listed on any exchange  
- ❌ Not governed by the Ghost DAO  

GHST exists **solely** for **devnet / testnet usage**.

---

## 📦 Location

```

contracts/sui/ghst-test/
├── Move.toml
├── README.md
└── sources/
└── ghst_token.move

```

---

## 🎯 Purpose

GHST is used for:
- Wallet integration testing
- Frontend development
- Transaction flow simulations
- Internal tooling and CI tests

It allows rapid iteration **without touching production assets**.

---

## 🪙 Token Parameters

| Field | Value |
|---|---|
| Name | Ghost Test Token |
| Symbol | GHST |
| Decimals | 9 |
| Supply | Variable (test-controlled) |
| Network | Sui devnet / testnet only |
| Standard | Sui `coin` framework |

---

## 🔐 Minting & Burning

- Minting is enabled via a local `TreasuryCap`
- Burning is supported for test scenarios
- No supply caps are enforced (by design)

⚠️ **Mint authority is NOT DAO-controlled**  
This is intentional for testing convenience.

---

## 🔒 Safety & Isolation Guarantees

GHST is fully isolated from production systems:

- Separate Move package
- Separate coin type
- Separate metadata
- No bridge hooks
- No shared code with GHOST

This ensures:
- Zero risk to mainnet supply
- No indexer confusion
- No exchange misclassification

---

## 🚫 Explicit Non-Goals

GHST will **never**:
- Be deployed to Sui mainnet
- Be wrapped or bridged
- Be listed on CoinMarketCap or CoinGecko
- Be upgrade-migrated into GHOST
- Be governed by the DAO

---

## 🧪 Testing Helpers

The module exposes:
- `init_for_test` (test-only initializer)
- Direct mint and burn entry functions

These are intended for:
- Unit tests
- Integration tests
- Localnet simulations

---

## 🔍 Audit Notes

- GHST is excluded from audits covering:
  - Canonical GHOST
  - DAO governance
  - Bridge security
- GHST may be modified or deleted without notice

Auditors should **ignore GHST for economic analysis**.

---

## 📜 License

See the root `LICENSE` file.
