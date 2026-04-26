```bash
#!/bin/bash

# XavaChain op-geth (Execution) startup script

# First, initialize the datadir with our genesis state
./op-geth/build/bin/geth init \
    --datadir ./datadir \
    ./genesis.json

# Now, start the execution client
./op-geth/build/bin/geth \
    --datadir ./datadir \
    --http \
    --http.corsdomain="*" \
    --http.vhosts="*" \
    --http.addr=0.0.0.0 \
    --http.port=8545 \
    --http.api=web3,debug,eth,txpool,net,engine \
    --ws \
    --ws.addr=0.0.0.0 \
    --ws.port=8546 \
    --ws.origins="*" \
    --ws.api=debug,eth,txpool,net,engine \
    --syncmode=full \
    --gcmode=archive \
    --nodiscover \
    --maxpeers=0 \
    --networkid=8888 \
    --authrpc.vhosts="*" \
    --authrpc.addr=0.0.0.0 \
    --authrpc.port=8551 \
    --authrpc.jwtsecret=./jwt.txt \
    --rollup.disabletxpoolgossip=true
    ```
