# Smart Contract System - README

This repository contains a modular and upgradeable smart contract system built using Solidity. The system leverages proxy patterns, code validation, and decentralized validator approval to manage dynamic program deployments, message passing, and state transitions. It is designed for scalability, security, and modularity, enabling the seamless creation, validation, and interaction with smart contracts (programs).

## Prerequisites

Ensure that you have the necessary dependencies set up before interacting with the system. You need to clone the following repositories into a `lib` directory within your project:

```bash
mkdir lib
cd lib
git clone https://github.com/OpenZeppelin/openzeppelin-contracts.git
git clone https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable.git
git clone https://github.com/OpenZeppelin/openzeppelin-foundry-upgrades.git
git clone https://github.com/Arachnid/solidity-stringutils.git
```

## Overview of the Smart Contract System

This smart contract system revolves around a core contract called Router, which acts as a central authority to manage:

***Program Creation:***

Developers submit their code for validation via the Router. Once the code is validated by a decentralized set of validators, they can create new smart contracts (referred to as "programs") based on this validated code.

***Validation by Validators:***

Validators play a critical role in ensuring the integrity of the system. They are responsible for validating code submissions and state transitions. The Router requires a threshold percentage of validator approvals to confirm changes or operations.

***Proxy Pattern for Upgradeability:***

The system makes use of the OpenZeppelin proxy pattern to ensure that contracts can be upgraded over time without changing the contract address. This allows for flexibility and the ability to implement new features without disrupting the user experience.

***Token Integration (Wrapped Vara):***

The system uses Wrapped Vara (WVARA), an ERC-20 token, for managing the economic layer. Users interact with this token when performing transactions such as program creation, message sending, and value transfers.

***Message and State Management:***

Messages between programs are handled through the Router. The Mirror and MirrorProxy contracts ensure that messages and responses are routed through the appropriate programs while maintaining state consistency.
Each program has its own state, and state transitions are validated through the Router, ensuring that only valid actions affect the state.


***Router:***

The core contract that manages program creation, code validation, and validator interactions. It also controls the economic parameters of the system (fees, weights, etc.) and validates messages and blocks.

***Mirror & MirrorProxy***

These contracts handle the interaction and message routing between programs. They ensure that messages and state transitions pass through the Router for validation before reaching the target program.

***Wrapped Vara (WVARA):***

A standard ERC-20 token that is used as the medium of value transfer within the system. The token supports minting and burning, allowing the owner to manage the total supply based on system needs.

***Validators:***

Validators are entities responsible for approving code and state transitions. They are managed by the Router, which maintains a set of validators and enforces the required approval threshold.

## How It Works


### Step 1: Code Submission

A developer submits their smart contract code for validation. The code is reviewed by validators, who ensure that it meets the necessary requirements.

### Step 2: Code Validation

Validators approve or reject the submitted code. Once a sufficient number of validators approve, the code is marked as valid and can be used to create programs.


### Step 3: Program Creation

The developer uses the validated code to create a new program via the Router. The Router deploys the program using a proxy pattern, ensuring that it can be upgraded in the future.


### Step 4: Interaction with Programs

Users interact with programs indirectly through the Router and Mirror. They can send messages, execute transactions, or claim value, all of which are routed through the Router to ensure proper validation and execution.


### Step 5: Validator Approval for State Changes

Any state transitions or important actions within programs are validated by the Router and the set of validators to ensure consistency and security.


### Step 6: Value Transfers

The Wrapped Vara token is used for all value transfers within the system, ensuring a secure and unified economic model.
Security Considerations
Reentrancy Protection: All sensitive operations are protected using the ReentrancyGuard pattern to prevent reentrancy attacks.
Signature Validation: The system uses ECDSA signatures to ensure that only authorized entities can submit transactions or approve state changes.
Validator Consensus: Validators act as decentralized checkpoints to maintain the integrity of code and state within the system, requiring a quorum for validation.

## Installing Forge

[Foundry](https://getfoundry.sh/) is a powerful development framework for Solidity, and Forge is its CLI tool. Follow these steps to install Forge and get started with Solidity development.

### Step 1: Install Foundry

To install Foundry, run the following command in your terminal:

```bash
curl -L https://foundry.paradigm.xyz | bash
```

### Step 2: Add Foundry to Your Path
After installation, you need to add Foundry to your system's path. Use the following commands based on your shell:

```bash
source ~/.bashrc
```
For zsh users:
```bash
source ~/.zshrc
```
### Step 3: Install Forge
Once Foundry is set up, install Forge by running the following command:
```bash
foundryup
```
This command installs the latest version of Forge and other Foundry tools.


###  Step 4: Verify Installation
To confirm that Forge has been installed correctly, check its version with the following command:
```bash
forge --version
```
If the installation is successful, you should see the Forge version displayed.

### Deploy

```shell
$ forge script script/Deploy.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```
