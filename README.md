# 🌐 XavaChain Core

![Build Status](https://img.shields.io/badge/Build-Success-brightgreen)
![OP Stack](https://img.shields.io/badge/Powered%20By-Optimism-red)
![License](https://img.shields.io/badge/License-MIT-blue)
![Network](https://img.shields.io/badge/Network-Layer--2-blueviolet)

XavaChain is a high-performance Layer-2 sovereign rollup built on top of the Ethereum Sepolia Testnet using the **OP Stack**. This repository contains the core genesis configurations, rollup parameters, and automation scripts required to initialize the network.

---

## 🚀 Project Overview

XavaChain aims to provide minimal transaction fees and high throughput by leveraging the Bedrock architecture of Optimism. The ecosystem revolves around our Telegram Mini-App (TMA) wallet and utilizes a custom Internal Liquidity Protocol.

### Key Specifications:
- **L1 Network:** Ethereum Sepolia
- **L2 Chain ID:** `8888`
- **Block Time:** 2 Seconds
- **Architecture:** OP Stack (Bedrock/Canyon/Ecotone)

---

## 💎 Tokenomics ($XAVA)

**$XAVA** is the native gas token of XavaChain, meaning all network transaction fees are paid in $XAVA instead of ETH. 

- **Total Supply:** 250,000,000 $XAVA
- **Utility:** Gas Fees, Governance, Staking Rewards, and TMA Ecosystem Access.

### Token Distribution
| Category | Allocation (%) | Tokens (M) | Lock/Vesting Period |
| :--- | :---: | :---: | :--- |
| **Community Airdrop** | 35% | 87.5M | **TGE:** 20% Unlocked, 80% over 180 days linear vesting. |
| **Ecosystem & Mining** | 30% | 75.0M | Task-based (Social/Mini-app engagement). |
| **Liquidity & Bridge** | 10% | 25.0M | Initial Liquidity (DEX) & Bridge Incentives. |
| **Team & Founders** | 15% | 37.5M | 6-month Cliff, then 180-day cyclic release. |
| **Treasury/Reserve** | 10% | 25.0M | Locked for future partnerships/listing. |

### Ecosystem Flywheel
- **Gas Fee Burning:** A portion of transaction fees is systematically burned to reduce circulating supply.
- **Proof-of-Task:** Users earn native $XAVA directly to their TMA wallet by completing social tasks and testing the network.

---

## ⛽ L1 Gas Price Oracle & Fee Model

`L1GasPriceOracle` is XavaChain's contract-level source of truth for L1 data pricing on L2. It tracks sequencer-updated L1 fee inputs, exposes a gas-optimized fee path for transaction estimation, and provides the operational controls needed to move from calldata pricing toward blob pricing over time.

### The Fee Equation
The oracle calculates the effective L1 data fee using the following core equation:

$$
\mathrm{L1Fee}(tx)=\frac{\mathrm{Gas}_{L1}(tx)\cdot \mathrm{Price}_{L1}\cdot \mathrm{Scalar}}{10^6}
$$

To optimize costs, the oracle discounts raw calldata weight with an empirically chosen compression ratio:

$$
\mathrm{Gas}_{L1}(tx)=\frac{\mathrm{Gas}_{raw}(tx)\cdot \mathrm{CompressionRatio}}{10^6}
$$

Additionally, the contract can dynamically price against calldata or blob cost:

$$
\mathrm{Price}_{L1}=
\begin{cases}
\mathrm{l1BaseFee}, & \text{if } \mathrm{useBlobPricing}=\mathrm{false} \\
\mathrm{l1BlobBaseFee}, & \text{if } \mathrm{useBlobPricing}=\mathrm{true}
\end{cases}
$$

### Off-chain PID Controller
The contract stores `scalar`, but it does not implement PID logic internally. The expected operating model is:
1. the sequencer or a controller service computes a new scalar offchain
2. the controller clamps it to the allowed range
3. the sequencer submits the new value onchain with `setScalar` or `setL1GasDataAndScalar`

---

## 📂 Repository Structure

| File | Description |
| :--- | :--- |
| `deploy-config.json` | The master configuration for network parameters (includes Native Gas config). |
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
```

---

### 3. Initialize Geth
```bash
geth init --datadir=./datadir genesis.json
```

### 🛡 Security & Governance

* **Guardian Address:** 0x4F707e337dfA90F559e02d598f072aBeA7179B1C
* **System Owner:** Admin controlled via Proxy contracts.

### 📄 License
*This project is licensed under the MIT License - see the LICENSE.md file for details.*

**Built with ❤️ for the decentralized future.**
