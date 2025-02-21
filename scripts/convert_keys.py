import base58
import json

# Read wallets from the file
with open("wallets.txt", "r") as file:
    wallets = file.readlines()

for i, line in enumerate(wallets):
    try:
        public_key, private_key_base58 = line.strip().split(":")
        
        # Decode base58 private key into bytes
        private_key_bytes = base58.b58decode(private_key_base58)

        # Convert to JSON format expected by Solana CLI
        private_key_json = list(private_key_bytes)

        # Save as a JSON file
        json_filename = f"wallet_{i}.json"
        with open(json_filename, "w") as json_file:
            json.dump(private_key_json, json_file)
        
        print(f"Converted: {public_key} -> {json_filename}")

    except Exception as e:
        print(f"Error processing {line}: {e}")
