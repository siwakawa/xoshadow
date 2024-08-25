# XO Shadow Protocol

> **Note:** This repository is intended to illustrate the concept of the XO Shadow protocol. It is not a final implementation and should be seen as a starting point or a proof of concept.

## Overview

**XO Shadow** is a privacy-focused protocol that allows users to interact with cryptocurrencies in a simple and secure way. The protocol introduces an alias system to ensure that user balances and transaction histories remain private. Using advanced cryptographic techniques, such as zero-knowledge proofs (zk-SNARKs), XO Shadow ensures privacy and security in all transactions.

## Watch the Demo

[![Watch the demo](https://img.youtube.com/vi/CmZvAAbASZk/0.jpg)](https://www.youtube.com/shorts/CmZvAAbASZk)

## Key Features

- **Alias System**: Users operate under aliases rather than public addresses. This protects the user's identity and ensures that their balances remain private. The alias is linked to a public key, but this mapping is securely stored and protected within the smart contract.

- **Shielded Transactions**: The protocol leverages zk-SNARKs to allow users to prove that they have sufficient funds to execute a transaction without revealing their actual balance.

- **Privacy by Design**: All balances and transaction details are encrypted and stored securely, ensuring that no third party can access sensitive information.

- **Secure Withdrawals**: When users withdraw funds, the transaction is processed in a shielded manner, ensuring that neither the alias nor the withdrawal address can be linked.

## Detailed Step-by-Step of How XO Shadow Works

### Step 1: Alias Creation
- **User A** registers an alias, e.g., `a1`.
- This alias is linked to a public key, but the relationship between the alias and the key is securely stored and encrypted within the smart contract.
- No third party can access the mapping between the alias and the public key.

### Step 2: Deposit Funds
- **User A** deposits funds into the alias `a1`.
- The contract receives the funds and stores the balance associated with `a1`. This balance is encrypted to prevent external access.
- The protocol uses cryptographic commitments to manage and track balances securely.

### Step 3: Direct Transactions Between Aliases
- **User A** (`a1`) wants to send funds to **User B** (`a2`) without needing to pre-fund the alias.
- **User A** generates a Zero-Knowledge Proof (ZKP) that proves they have sufficient funds for the transaction without revealing the actual balance.
- **User A** sends the ZKP and the transaction amount to the smart contract.
- The contract verifies the ZKP, confirming that **User A** has enough funds, and if valid, transfers the funds from `a1` to `a2`.
- The updated balances of both `a1` and `a2` are encrypted and securely stored in the contract.

### Step 4: Withdrawal of Funds
- **User A** decides to withdraw funds from `a1` to an external address.
- The transaction is processed using shielded transactions (zk-SNARKs), ensuring that neither the alias `a1` nor the withdrawal address is exposed.
- The contract processes the withdrawal while maintaining the privacy of both the alias and the destination address.
- The transaction is recorded on the blockchain, but the details are hidden from observers.

### Step 5: Privacy Protection
- Throughout the entire process, all sensitive data, such as balances and alias-public key mappings, are encrypted or hashed.
- Zero-knowledge proofs ensure that transactions are validated without exposing any unnecessary information.
- The protocol guarantees that no third party can link an alias to a balance or a withdrawal address.

## Installation

To get started with XO Shadow, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/siwakawa/xoshadow.git

