

Welcome to **aribaBank**, a beginner-friendly **Solidity smart contract** project that demonstrates how a **decentralized on-chain banking system** can work transparently and securely on the blockchain.


<img width="1920" height="1080" alt="Screenshot (119)" src="https://github.com/user-attachments/assets/c8bdded1-ab4f-499b-bc62-8eb84edac404" />

---

## 🏦 Project Description

**aribaBank** is a simple yet powerful example of a **transparent, decentralized banking system** built entirely on the blockchain.  
It allows users to **deposit, withdraw, and transfer ETH** securely — all actions are recorded **on-chain** for full transparency.

This project aims to **teach Solidity beginners** how to handle Ether transactions, mappings, modifiers, events, and security mechanisms such as **reentrancy protection**.

---

## ⚙️ What It Does

- 💸 **Deposits** — Users can deposit ETH directly into the contract.  
- 💰 **Withdrawals** — Withdraw your balance anytime securely.  
- 🔁 **Transfers** — Instantly send ETH (within the system) to other users.  
- 🧾 **Track Balances** — Check your balance and view others’ balances transparently.  
- 🧑‍💼 **Owner Controls** — The contract owner can perform emergency withdrawals.  
- 🔒 **Security Features** — Built-in protection against reentrancy attacks.

All transactions are **stored on the blockchain**, ensuring transparency and immutability.

---

## 🌟 Features

✅ Fully decentralized ETH banking  
✅ Transparent balance tracking on-chain  
✅ Deposit / Withdraw / Transfer functions  
✅ Owner-only emergency withdrawal  
✅ Built-in nonReentrant security  
✅ Beginner-friendly and easy to deploy  
✅ Clean code with comments and NatSpec documentation  

---

## 🔗 Deployed Smart Contract

> **Network:** Celo Sepolia Testnet  
> **Explorer:** [View on Blockscout](https://celo-sepolia.blockscout.com/address/0xa154E530a5E589721A46ea41F59A4e525F364D35)

```

0xa154E530a5E589721A46ea41F59A4e525F364D35

````

---

## 📜 Smart Contract Code

```solidity
//paste your code
````

---

## 🚀 Getting Started

### 🧰 Prerequisites

* [Remix IDE](https://remix.ethereum.org/) (no setup needed!)
* Or local setup with:

  * Node.js & npm
  * Hardhat or Foundry
  * MetaMask (for deployment/testing)

### 🪜 Steps to Run

1. Open Remix and paste the contract code into a new file named `aribaBank.sol`.
2. Compile the contract with Solidity version **^0.8.19**.
3. Deploy on any testnet (like **Celo Sepolia**, Goerli, or Sepolia).
4. Interact using the **Remix interface**:

   * Call `deposit()` and send ETH.
   * View your balance with `myBalance()`.
   * Withdraw using `withdraw(amount)`.
   * Transfer to other users via `transferTo(address, amount)`.

---

## 💡 Example Usage

| Action          | Description                        | Function                                 |
| --------------- | ---------------------------------- | ---------------------------------------- |
| Deposit ETH     | Add funds to your on-chain account | `deposit()`                              |
| Withdraw ETH    | Retrieve your funds                | `withdraw(uint256 amount)`               |
| Transfer ETH    | Send ETH to another user           | `transferTo(address to, uint256 amount)` |
| View My Balance | Check your own balance             | `myBalance()`                            |
| Check Any User  | View others’ balances              | `balanceOf(address)`                     |

---

## ⚠️ Disclaimer

This project is for **educational purposes only**.
It’s **not audited** and should **not be used with real funds** on the mainnet.
Always test thoroughly before deployment.

---

## ✨ Author

👩‍💻 **Ariba** — *Blockchain & DevOps Enthusiast*
🔗 GitHub: [XXX](#)
💬 “Building transparent systems, one block at a time.”

---

## ⭐ Support & Feedback

If you find this project helpful:

* Give it a ⭐ on GitHub
* Share your feedback
* Fork and build something even better!


