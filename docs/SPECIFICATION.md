# XavaChain Technical Specifications

## 1. Native Tokenomics ($XAVA)
XavaChain operates with $XAVA as the native gas token.
- **Total Supply:** 250,000,000 $XAVA
- **Precision:** 18 Decimals
- **Distribution Logic:** 35% Airdrop, 30% Ecosystem/Mining, 15% Team, 10% Liquidity, 10% Treasury.

## 2. L1 Fee Oracle Integration
We implement the `L1GasPriceOracle` to manage L1 data costs.

### Dynamic Scalar Management
The $XAVA fee model uses a scalar to adjust for L1 cost fluctuations:
- **Base Fee Tracking:** Tracks `l1BaseFee` and `l1BlobBaseFee`.
- **Compression Efficiency:** Applied via `CompressionRatio` (Default: 0.5x).

## 3. Burn Mechanism
To maintain $XAVA scarcity, 15% of all transaction fees collected in $XAVA are automatically sent to the dead address `0x0000...dEaD`.
