#!/bin/bash

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add the WebAssembly target for Rust
rustup target add wasm32-unknown-unknown

# Install Stellar CLI
cargo install --locked stellar-cli --features opt

# Add the Stellar testnet network
stellar network add --global testnet --rpc-url --network-passphrase "Test SDF Network ; September 2015"

# Generate keys for the testnet
stellar keys generate --global james --network testnet

# Display the address for the keys
stellar keys address james

# Initialize the Stellar contract
stellar contract init

# Run the tests
cargo test

# Build the project targeting WebAssembly
cargo build --target wasm32-unknown-unknown --release

# Deploy the Stellar contract
stellar contract deploy --wasm target/wasm32-unknown-unknown/release/hello_world.wasm --source james --network testnet

# Invoke the Stellar contract
stellar contract invoke --id CONTRACT_HERE --source james --network testnet -- hello --to RPC
