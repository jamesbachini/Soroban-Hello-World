# Hello World Soroban Smart Contract

Tutorial available at:
https://jamesbachini.com/building-rust-smart-contracts-on-stellar-soroban/

## Overview

This repository provides a tutorial for building, deploying, and interacting with a simple "Hello World" smart contract on the Stellar Soroban platform. The contract is written in Rust using the Soroban SDK, and this README serves as a guide to set up your environment, deploy the contract, and interact with it on the Stellar testnet.

## Soroban

Soroban is the smart contract platform on the Stellar network, enabling developers to build decentralized applications and deploy smart contracts. This tutorial walks you through deploying a simple "Hello World" contract, which will return a greeting message, demonstrating how easy it is to interact with Soroban's contract framework.


### Step 1: Install Rust and Soroban CLI

1. Install Rust:

   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. Add the WebAssembly target for Rust:

   ```bash
   rustup target add wasm32-unknown-unknown
   ```

3. Install the Stellar CLI:

   ```bash
   cargo install --locked stellar-cli --features opt
   ```

### Step 2: Set Up the Stellar Network

1. Add the Stellar testnet network:

   ```bash
   stellar network add --global testnet --rpc-url https://soroban-testnet.stellar.org --network-passphrase "Test SDF Network ; September 2015"
   ```

2. Generate a new wallet and store it as `james`:

   ```bash
   stellar keys generate --global james --network testnet
   ```

3. Get the wallet address:

   ```bash
   stellar keys address james
   ```

### Step 3: Initialize and Test the Contract

1. Initialize the contract:

   ```bash
   stellar contract init
   ```

2. Run the unit tests:

   ```bash
   cargo test
   ```

### Step 4: Build and Deploy the Contract

1. Build the contract targeting WebAssembly:

   ```bash
   cargo build --target wasm32-unknown-unknown --release
   ```

2. Deploy the compiled WebAssembly contract:

   ```bash
   stellar contract deploy --wasm target/wasm32-unknown-unknown/release/hello_world.wasm --source james --network testnet
   ```

### Step 5: Invoke the Contract

1. Invoke the contract by calling the `hello` function:

   ```bash
   stellar contract invoke --id CONTRACT_ID --source james --network testnet -- hello --to RPC
   ```

   Replace `CONTRACT_ID` and `RPC` with the appropriate contract ID and recipient name.

### Step 6: Obtain Testnet XLM

You will need testnet XLM to deploy and call functions. Use the [Stellar Friendbot](https://friendbot.stellar.org) to get testnet XLM by appending your public address to the URL:

```bash
https://friendbot.stellar.org?addr=YOUR_PUBLIC_KEY
```

## Connecting a Frontend to the Contract

You can connect your smart contract to the index.html frontend

Replace `CONTRACT_ID` with the contract's ID.

Upload it to a web server or run it with http-server in nodejs

```bash
npm install http-server
npx http-server ./
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Links

- [Website](https://jamesbachini.com)
- [YouTube](https://www.youtube.com/c/JamesBachini?sub_confirmation=1)
- [Substack](https://bachini.substack.com)
- [Podcast](https://podcasters.spotify.com/pod/show/jamesbachini)
- [Spotify](https://open.spotify.com/show/2N0D9nvdxoe9rY3jxE4nOZ)
- [Twitter](https://twitter.com/james_bachini)
- [LinkedIn](https://www.linkedin.com/in/james-bachini/)
- [GitHub](https://github.com/jamesbachini)

## Resources

### Stellar Developer Resources

Here is a list of essential resources for Stellar developers, including official documentation for Soroban, JavaScript SDK, and other tools and platforms.

---

#### **Official Documentation and SDKs**

- **[Stellar Developers](https://developers.stellar.org/)**  
  The main hub for all developer resources, including guides, tools, and APIs.

- **[Soroban Smart Contracts Documentation](https://soroban.stellar.org/docs)**  
  Learn how to develop and deploy smart contracts on Soroban, Stellar’s smart contract platform.

- **[JavaScript SDK Documentation](https://stellar.github.io/js-stellar-sdk/)**  
  Documentation for Stellar's JavaScript SDK, used to interact with the Stellar network and build web-based applications.

- **[Python SDK Documentation](https://stellar.github.io/py-stellar-base/)**  
  Resources and examples for building Stellar applications using Python.

- **[Java SDK Documentation](https://stellar.github.io/java-stellar-sdk/)**  
  Guides and API references for building Stellar-based applications in Java.

- **[Go SDK Documentation](https://github.com/stellar/go)**  
  Stellar SDK for Go developers, including installation instructions and guides for interacting with the Stellar network.

---

#### **Developer Tools and APIs**

- **[Stellar Horizon API Documentation](https://developers.stellar.org/docs/horizon-api/)**  
  Comprehensive documentation for Horizon, the RESTful API that allows you to interact with the Stellar blockchain.

- **[Stellar Laboratory](https://lab.stellar.org/)**  
  A web-based tool to experiment with the Stellar network, build transactions, and communicate with the Horizon API.

---

#### **Exploring the Stellar Network**

- **[Stellar Friendbot](https://friendbot.stellar.org/)**  
  A tool to fund your Stellar testnet account with free testnet Lumens (XLM).

- **[Stellar Explorer](https://stellarchain.io/)**  
  A block explorer to track transactions, accounts, and assets on the Stellar network.

---

#### **Community and Learning**

- **[Stellar Developers Discord](https://discord.gg/stellar)**  
  Official Discord server for Stellar developers, where you can ask questions, share ideas, and get support from the community.

- **[Stellar Stack Exchange](https://stellar.stackexchange.com/)**  
  A community-driven Q&A platform where Stellar developers can ask and answer questions about the platform.

- **[Stellar Community Blog](https://www.stellar.org/blog)**  
  Stay up to date with news, updates, and tutorials from Stellar’s development community.
