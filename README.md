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
