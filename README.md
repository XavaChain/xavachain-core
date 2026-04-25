# 🌐 XavaChain Core

![Build Status](https://img.shields.io/badge/Build-Success-brightgreen)
![OP Stack](https://img.shields.io/badge/Powered%20By-Optimism-red)
![License](https://img.shields.io/badge/License-MIT-blue)
![Network](https://img.shields.io/badge/Network-Layer--2-blueviolet)

XavaChain is a high-performance Layer-2 sovereign rollup built on top of the Ethereum Sepolia Testnet using the **OP Stack**. This repository contains the core genesis configurations, rollup parameters, and automation scripts required to initialize the network.

---

## 🚀 Project Overview

XavaChain aims to provide minimal transaction fees and high throughput by leveraging the Bedrock architecture of Optimism. It features a custom internal Automated Market Maker (AMM) logic and a decentralized liquidity protocol.

### Key Specifications:
- **L1 Network:** Ethereum Sepolia
- **L2 Chain ID:** `8888`
- **Block Time:** 2 Seconds
- **Architecture:** OP Stack (Bedrock/Canyon/Ecotone)

---

## 📂 Repository Structure

| File | Description |
| :--- | :--- |
| `deploy-config.json` | The master configuration for network parameters. |
| `l1-deployments.json` | Contract addresses deployed on the L1 (Sepolia). |
| `genesis.json` | The initial state of the L2 blockchain. |
| `rollup.json` | Rollup configuration for the op-node. |
| `build-xava.sh` | Automation script to regenerate genesis files. |

---

## 🛠 Setup & Initialization

To regenerate the genesis files or start the node, follow these steps:

### 1. Prerequisites
Ensure you have the Optimism monorepo environment set up and `go` installed.

### 2. Generate Genesis Files
```bash
chmod +x build-xava.sh
./build-xava.sh

---
---

### 3. Initialize Geth
```bash
geth init --datadir=./datadir genesis.json

**🛡 Security & Governance**

* *Guardian Address:* 0x4F707e337dfA90F559e02d598f072aBeA7179B1C

* *System Owner:* Admin controlled via Proxy contracts.

---
---

**📄 License**
This project is licensed under the MIT License - see the LICENSE.md file for details.

*Built with ❤️ for the decentralized future.*
