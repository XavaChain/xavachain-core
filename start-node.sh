```bash
#!/bin/bash

# XavaChain op-node startup script

./optimism/op-node/bin/op-node \
    --l1 https://rpc.ankr.com/eth_sepolia/65b3b2bd945a2169a6605e86e1d7e40bca250d799274ab4e4ee673f6bf236305 \
    --l1.beacon https://ethereum-sepolia-beacon-api.publicnode.com \
    --l2 http://localhost:8551 \
    --l2.jwt-secret ./jwt.txt \
    --rollup.config ./rollup.json \
    --rpc.addr 0.0.0.0 \
    --rpc.port 9545 \
    --p2p.disable \
    --sequencer.enabled \
    --sequencer.l1-confs 3 \
    --verifier.l1-confs 3
    ```
