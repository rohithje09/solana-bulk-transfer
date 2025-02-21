# Solana Bulk Transfer Script

A simple script to transfer SOL from multiple wallets to a master wallet.

## Features

- ✅ Convert Base58 private keys to Solana-compatible JSON format  
- ✅ Batch transfer SOL from multiple wallets  
- ✅ Automatically leaves **0.002 SOL** for transaction fees  

## Requirements

- Python 3  
- Solana CLI (`solana --version`)  
- `base58` Python package  

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/solana-bulk-transfer.git
cd solana-bulk-transfer
```

### 2. Install Dependencies

```bash
pip install base58
```

### 3. Configure Wallets

Create a `wallets.txt` file in the root directory with this format:  
```
PublicAddress:PrivateKeyBase58
PublicAddress2:PrivateKeyBase58
```

### 4. Convert Keys

Run the conversion script:  
```bash
python3 scripts/convert_keys.py
```

This generates a `wallets.json` file with converted keys.

### 5. Execute Bulk Transfer

Run the transfer script:  
```bash
bash scripts/bulk_transfer.sh
```

## Notes

- 🔒 **Security**: Never commit private keys to public repositories.  
- 🧪 **Testing**: Always test with a small amount first.  
- 🎯 **Master Wallet**: Update `bulk_transfer.sh` with your master wallet address.  
