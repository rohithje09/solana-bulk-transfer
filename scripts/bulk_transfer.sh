#!/bin/bash

MASTER_WALLET="##"  # Replace with your actual master wallet address

for WALLET_JSON in wallet_*.json; do
    echo "Using wallet: $WALLET_JSON"
    
    # Set the wallet as the active keypair
    solana config set --keypair "$WALLET_JSON" > /dev/null 2>&1

    # Get balance
    BALANCE=$(solana balance | awk '{print $1}')
    
    # Ensure sufficient balance
    if (( $(echo "$BALANCE > 0.002" | bc -l) )); then
        AMOUNT=$(echo "$BALANCE - 0.002" | bc)  # Subtract fee
        echo "Transferring $AMOUNT SOL from $WALLET_JSON to $MASTER_WALLET"
        solana transfer $MASTER_WALLET $AMOUNT --allow-unfunded-recipient --fee-payer "$WALLET_JSON"
    else
        echo "Skipping $WALLET_JSON due to insufficient balance."
    fi
done
