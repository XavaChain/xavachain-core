#!/bin/bash

# XavaChain Genesis Automation Script
echo "🚀 Starting XavaChain Genesis Build Process..."

# Set paths
XAVA_DIR="/workspaces/L1GasPriceOracle/xava"
OP_NODE_DIR="/workspaces/L1GasPriceOracle/optimism"

# Clean old state files to prevent cache errors
echo "🧹 Cleaning old configuration files..."
rm -f $XAVA_DIR/genesis.json
rm -f $XAVA_DIR/rollup.json

# Generate new Genesis and Rollup configs
echo "⚙️ Generating genesis.json and rollup.json..."
cd $OP_NODE_DIR

go run ./op-node/cmd/main.go genesis l2 \
    --deploy-config $XAVA_DIR/deploy-config.json \
    --l1-deployments $XAVA_DIR/l1-deployments.json \
    --outfile.l2 $XAVA_DIR/genesis.json \
    --outfile.rollup $XAVA_DIR/rollup.json \
    --l1-rpc https://ethereum-sepolia-rpc.publicnode.com

if [ $? -eq 0 ]; then
    echo "✅ Success! genesis.json and rollup.json created perfectly."
    echo "You can now push these files to GitHub."
else
    echo "❌ Build failed. Please check the config files."
fi

