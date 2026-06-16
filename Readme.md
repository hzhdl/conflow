# ConFlow

ConFlow is the research artifact accompanying the paper [ConFlow: A Framework That Enables Cross-Chain Flow Of Smart Contract State Data](). The project studies the cross-chain flow of smart contract state data (CFSD): how state generated on one blockchain can be aggregated, validated, and consumed on another without relying on a single trusted relay.

The paper frames ConFlow around two core goals:
- data authenticity, handled by a truth-discovery based off-chain aggregation pipeline;
- data verifiability, handled by zero-knowledge based batch verification over smart contract state transitions.

This repository packages the simulator, collector/prover prototype, truth discovery experiments, smart-contract tests, and zk circuit artifacts used to evaluate that design.

## Overview

ConFlow combines three main ideas from the paper:
- a reputation-aware truth discovery workflow for aggregating collector reports;
- an MTC-based state representation for verifiable state transitions;
- a zk-backed batch verification path that moves repeated verification work off chain.

The repository should be read as a paper artifact and experimental codebase. Its primary value is that the architecture described in the manuscript is traceable to concrete components in the repo.




## Repository Map

| Path | Role in the paper | Notes |
| --- | --- | --- |
| `collector/` | Collector prototype | Koa-based collectors that tag reports and push them to RabbitMQ queues. |
| `prover/` | Prover-side pipeline | Message ingestion, data buffering, truth discovery code, and circom artifacts. |
| `prover/TD/` | Truth discovery experiments | Contains `CRH.py`, `RCRH.py`, synthetic data generation, and experiment scripts. |
| `prover/circom/` | ZK-SDBV artifacts | Batch proof circuits, generated proving assets, and gas-oriented verification tests. |
| `simulator/srcsim/` | Source blockchain simulator | Generates synthetic contract-state workloads and injects them into collectors. |
| `MTC_Test/` | On-chain MTC / HashChain evaluation | Hardhat contracts and tests for gas and verification comparisons. |

## Artifact Walkthrough

### 1. Off-chain data aggregation path

The collector/prover path models the data plane described in the paper.

Typical entry points:

```bash
cd collector
npm install
node main.js
```

```bash
cd prover
python consumer.py
```

```bash
cd simulator/srcsim
npm install
node test/test.js
```

Relevant code:
- `collector/main.js` starts 100 collector instances on ports `3000` and above.
- `collector/routes/dataRoutes.js` accepts `/senddata` payloads and republishes them to RabbitMQ.
- `prover/consumer.py`, `prover/processor.py`, and `prover/Data.py` form the ingestion and aggregation path.
- `simulator/srcsim/src/datagen.js` and `simulator/srcsim/test/test.js` generate imbalanced and malicious-source workloads for experiments.

Implementation note:
- The paper describes an RTD mechanism.
- The repository contains both `CRH` and the reputation-aware `RCRH` implementation under `prover/TD/`.
- The current aggregation path in `prover/Data.py` instantiates `CRH()` while also shipping `RCRH()` for the experiment code.

For standalone truth-discovery experiments, the experiment driver lives under `prover/TD/`, for example:

```bash
cd prover
python TD/testTD.py
```

### 2. MTC and verification-contract gas experiments

`MTC_Test/` contains the Solidity contracts and Hardhat tests used to compare MTC-style state handling with HashChain-based baselines.

Typical workflow:

```bash
cd MTC_Test
npm install
npx hardhat test test/test.js
```

Key files:
- `contracts/HashChain.sol`
- `contracts/Copy_MTC.sol`, `contracts/Copy_MTC4.sol`, `contracts/Copy_MTC8.sol`
- `contracts/VertifyMTC.sol`
- `test/test.js`

### 3. ZK proof and verification artifacts

`prover/circom/` contains circom circuits, generated proving assets, and verification-contract experiments for the batched proof path described in the paper.

Useful locations:
- `prover/circom/MMP2/` stores batch circuits and generated assets for batch sizes `8`, `10`, `12`, `14`, and `16`.
- `prover/circom/con_gas/contracts/` stores pre-generated `proof`, `public`, and verifier-contract artifacts.
- `prover/circom/con_gas/test/Lock.js` evaluates verifier deployment and proof-verification gas.

Typical workflow:

```bash
cd prover/circom/con_gas
npm install
npx hardhat test test/Lock.js
```

## Deployment Environment

This repository only gives a **single-chain deployment example**. In actual use, you can extend it to **multiple source and target chains** by deploying more private-chain instances and updating the corresponding RPC endpoints.

Supported blockchain environments:
- **Ethereum-compatible private chains**, such as OpenEthereum-based networks. Upstream repository: [openethereum/openethereum](https://github.com/openethereum/openethereum)
- **FISCO-BCOS consortium chains**. Upstream repository: [FISCO-BCOS/FISCO-BCOS](https://github.com/FISCO-BCOS/FISCO-BCOS)

Deployment notes:
- The current example scripts assume a pre-existing private chain and do not bootstrap the blockchain network by themselves.
- If you switch chains or expand to multiple chains, update the RPC settings in the Hardhat config files and test scripts accordingly.
- More blockchain-specific deployment details can be found in the official repositories above.

## More Information

More details will be added soon.
