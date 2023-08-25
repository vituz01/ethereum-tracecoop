# Workflow validation for agri-food traceability with Ethereum smart contract

## Tracecoop project
Tracecoop is a REST microservices platform which uses blockchain technology to allow each supply chain stakeholder to register product information and access it via
the workflows exposed by the application, which call a Smart Contract released on the Ethereum blockchain to leverage benefits such as data security, immutability and transparency
guaranteed by the underlying technology.

![image](https://github.com/vituz01/ethereum-tracecoop/assets/93040077/fb31afdf-ba7f-42ba-9d76-a49d5c03d604)

## Goals
This repository is intended to give a Solidity implementation for the Ethereum smart contract called by the workflows of the Tracecoop project.
This has been achieved by the three following steps:
1. Functional analysis of the client requirements and UML modeling of Tracecoop contract functionalities.
2. Solidity implementation of an Ethereum smart contract to register and access to product info stored on the chain.
3. Testing and E2E software validation via unit tests in Mocha.
   
## UML
### Use cases diagram
![image](https://github.com/vituz01/ethereum-tracecoop/assets/93040077/3e440a99-6e7d-47f4-bfef-e6f0c7fe606a)
### Sequence diagram
![image](https://github.com/vituz01/ethereum-tracecoop/assets/93040077/ae89ff01-e058-4c16-a57c-5ab854ce7963)

## Technologies
### Blockchain
Blockchain is a shared, immutable ledger that facilitates the process of recording transactions and tracking assets in a business network. An asset can be tangible (a house, car, cash, land) or intangible (intellectual property, patents, copyrights, branding). Virtually anything of value can be tracked and traded on a blockchain network, reducing risk and cutting costs for all involved.

*Main benefits of using blockchain*
- Immutability
- Decentralization
- Security
- Transparency
  
![image](https://github.com/vituz01/ethereum-tracecoop/assets/93040077/fbe95cc2-925c-4c4b-9665-f6ba1fb1c98d)

### Solidity
Solidity is the primary programming language for creating smart contracts on the Ethereum platform. It's a statically-typed language, similar to JavaScript in syntax, that allows developers to define the logic of their smart contracts. Solidity supports features like inheritance, libraries, user-defined types, and more. It compiles into bytecode that can be executed on the Ethereum Virtual Machine (EVM).

### Smart contracts
A smart contract is a self-executing program that runs on a blockchain. It automates the execution of an agreement or transaction when predefined conditions are met. Smart contracts eliminate the need for intermediaries and make processes more efficient, transparent, and secure. They are tamper-proof and irreversible once deployed to the blockchain.

Smart contracts can be used for a wide range of applications, including:

* Financial Services: Token issuance, decentralized finance (DeFi) protocols, lending platforms, etc.
* Supply Chain: Tracking goods, verifying authenticity, and automating supply chain processes.
* Gaming: Creating decentralized games with provably fair mechanics.
* Identity Verification: Securely managing digital identities and access control.
* Real Estate: Automating property transfers, rental agreements, and more.
* Healthcare: Managing medical records, insurance claims, and other healthcare processes.


