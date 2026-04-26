#!/bin/bash
# XavaChain Core Build Script (Native Token: $XAVA)

echo "🚀 Building XavaChain with Native Gas Token..."

XAVA_DIR="/workspaces/L1GasPriceOracle/xava"
OP_NODE_DIR="/workspaces/L1GasPriceOracle/optimism"

# Clear old cache
rm -f $XAVA_DIR/genesis.json $XAVA_DIR/rollup.json

cd $OP_NODE_DIR
go run ./op-node/cmd/main.go genesis l2 \
    --deploy-config $XAVA_DIR/deploy-config.json \
    --l1-deployments $XAVA_DIR/l1-deployments.json \
    --outfile.l2 $XAVA_DIR/genesis.json \
    --outfile.rollup $XAVA_DIR/rollup.json \
    --l2-allocs $XAVA_DIR/l2-allocs.json \
    --custom-gas-token true

echo "✅ XavaChain Genesis successfully generated with $XAVA as Native Gas."
