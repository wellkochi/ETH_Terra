# Terra Cross-Chain Proposal

This is a proposal to issue and store Terra Token (TER) token on Ethereum ([ERC-20](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md)) while use [Dfinity](https://dfinity.org/) (development in progress) to compute and run transactions.

## Background
While Ethereum is by far the leading plaform for DApps and tokens, it has a major drawback: scalability. Current Ethereum mainnet processes ~15tx/s (for contrast, Visa processes ~2000tx/s). Consider the current DApp environment, this is not a big issue since there are not many users. However, in order to see the mainstream adoption of blockchain technology, scalability and transaction speed are definitely predominant factors.

The Ethereum community is currently working on these issues and many projects are being developed (State Channel, Plasma, Sharding, TrueBit, etc). Ethereum, with its community, is on the trajectory to [**Ethererum 2.0**](https://medium.com/rocket-pool/ethereum-2-0-76d0c8a76605) in 2020. I am excited to see how these changes can improve Ethereum's performance.

While Ethereum community is working on Ethereum 2.0, there are other platfroms with smiliar functionalities to compete with Ethereum. Some of them are:
* [EOS](https://eos.io/)
* [Nebulas](https://nebulas.io/)
* [Dfinity](https://dfinity.org/)

**In this case, I propose a system that issue and store token on Ethereum and uses Dfinity for computation.**

## Architecture
![alt text](https://github.com/wellkochi/Terra/blob/master/Cross-Chain.jpeg)

#### Ethereum
We will issue 1000 TER tokens on Ethereum as [ERC-20 (EIP-20) standard](https://github.com/ConsenSys/Tokens/blob/master/contracts/eip20/EIP20Interface.sol). 
#### Cross-Chain Protocol
As to my knowledge, at present, blockchains are isolated islands themselves. However, interoperability projects are being developed. some of them are:
* [COSMOS](https://cosmos.network/) with its [Tendermint](https://tendermint.com/) and [Ethermint](https://github.com/cosmos/ethermint)
* [Polkadot](https://polkadot.network/) ([repo](https://github.com/paritytech/polkadot))
* [Interledger](https://interledger.org/)
#### Dfinity
[Some stats](https://www.reddit.com/r/dfinity/comments/8abkb0/how_many_transactions_per_second_can_dfinity_do/) about Dfinity:
* **Blocktime**: 0.5 second on testnet (from blog post), 5-10 SEC in practice (from the website). (EOS claims 0.5s in white paper but presumably will also have to detune)
* **Gas per block**: 125-250M (from the website) (Ethereum gas limit is currently 8M, EOS doesn't seem to have a gas concept but total bandwidth will be limited by the block producers in some unspecified but equivalent way. Interestingly EOS won't have parallel transactions or sharding at network launch so throughput is presumably bounded by the capacity of block producers)
* **Finality time**: 2 blocks (from the website). (Ethereum finality depends on Casper design. EOS seems to be 2 seconds on the testnet or 4 blocks)

