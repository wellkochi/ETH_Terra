# Terra Cross-Chain Proposal

This is a proposal to issue and store Terra token (TER) on Ethereum ([ERC-20](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md)) while use [Dfinity](https://dfinity.org/) (development in progress) to compute and run transactions. 

**Notes: As for October 2018, blockchain interoperability projects are still under development and in pre-alpha phase. Therefore, this is merely a proposal and shall be referenced in the future.**

## Background
While Ethereum is by far the leading plaform for DApps and tokens, it has a major drawback: scalability. Current Ethereum mainnet processes ~15tx/s (for contrast, Visa processes ~2000tx/s). Consider the current DApp environment, this is not a big issue since there are not many users. However, in order to see the mainstream adoption of blockchain technology, scalability and transaction speed are definitely predominant factors.

The Ethereum community is currently working on these issues and many projects are being developed (State Channel, Plasma, Sharding, TrueBit, etc). Ethereum, with its community, is on the trajectory to [**Ethererum 2.0**](https://medium.com/rocket-pool/ethereum-2-0-76d0c8a76605) in 2020. I am excited to see how these changes can improve Ethereum's performance.

While Ethereum community is working on Ethereum 2.0, there are other platfroms with smiliar functionalities to compete with Ethereum. Some of them are:
* [EOS](https://eos.io/)
* [Nebulas](https://nebulas.io/)
* [Dfinity](https://dfinity.org/)

## Architecture
![Concept](https://github.com/wellkochi/Terra/blob/master/Concept.jpeg)

### Ethereum
We will issue 1000 Terra token (TER) on Ethereum as [ERC-20 (EIP-20) standard](https://github.com/ConsenSys/Tokens/blob/master/contracts/eip20/EIP20Interface.sol). 

### Cross-Chain Protocol
As to my knowledge, at present, blockchains are isolated islands themselves. However, interoperability projects are being developed and they are in pre-alpha phase. Some of them are:
* [Cosmos](https://cosmos.network/) with its [Tendermint](https://tendermint.com/) and [Ethermint](https://github.com/cosmos/ethermint)
* [Polkadot](https://polkadot.network/) ([repo](https://github.com/paritytech/polkadot))
* [Interledger](https://interledger.org/)
* [Atomic Swap](https://www.investopedia.com/terms/a/atomic-swaps.asp) - good for DEX and crypto trading

### Dfinity (development in progress)
[Some stats](https://www.reddit.com/r/dfinity/comments/8abkb0/how_many_transactions_per_second_can_dfinity_do/) about Dfinity:
> * **Blocktime**: 0.5 second on testnet (from blog post), 5-10 SEC in practice (from the website). (EOS claims 0.5s in white paper but presumably will also have to detune)
> * **Gas per block**: 125-250M (from the website) (Ethereum gas limit is currently 8M, EOS doesn't seem to have a gas concept but total bandwidth will be limited by the block producers in some unspecified but equivalent way. Interestingly EOS won't have parallel transactions or sharding at network launch so throughput is presumably bounded by the capacity of block producers)
> * **Finality time**: 2 blocks (from the website). (Ethereum finality depends on Casper design. EOS seems to be 2 seconds on the testnet or 4 blocks)

---
![Example](https://github.com/wellkochi/Terra/blob/master/Example.png)
### ETH Wallet
You can use [MetaMask](https://metamask.io/) or [MyEtherWallet](https://www.myetherwallet.com/). 1000 Terra token (TER) has been issued on Ropsten testnet, which you can redeem them by sending Ropsten ETH to [0xC26684Cd4e334D8435C15C9c16e76A8f1d5035Db](https://ropsten.etherscan.io/token/0xc26684cd4e334d8435c15c9c16e76a8f1d5035db). 

**Exchange rate: 1 ETH = 2 TER.** You can check TER token supply info [here](https://ropsten.etherscan.io/token/0xc26684cd4e334d8435c15c9c16e76a8f1d5035db).

### Atomic Swap
In this case, we will use [Atomic Swap](https://www.investopedia.com/terms/a/atomic-swaps.asp) to exchange our TER token for other tokens. Atomic Swap is a popular method used in decentralized exchange (DEX). Check out explanation [here](https://www.cryptocompare.com/coins/guides/what-are-atomic-swaps/) and video explanation [here](https://youtu.be/C2Io5DoLGGc).
![Decred](https://raw.githubusercontent.com/decred/atomicswap/master/workflow.svg?sanitize=true)

([Source](https://github.com/decred/atomicswap))

### DNF Wallet (mimic)
Like aforementioned, DNF is still under development, so we will create a blockchain to mimic Dfinity blockchain. 
**You will need to do two things: 
1. Use MultiChain to create your own blockchain. Please proceed to [here](https://www.multichain.com/getting-started/).
2. Once the mimic blockchain is built, proceed to [here](https://www.multichain.com/developers/atomic-exchange-transactions/) to do a simple Atomic exchange.

---
![Example_2](https://github.com/wellkochi/Terra/blob/master/Example_2.png)
### ETH Wallet
You can use [MetaMask](https://metamask.io/) or [MyEtherWallet](https://www.myetherwallet.com/). 1000 Terra token (TER) has been issued on Ropsten testnet, which you can redeem them by sending Ropsten ETH to [0xC26684Cd4e334D8435C15C9c16e76A8f1d5035Db](https://ropsten.etherscan.io/token/0xc26684cd4e334d8435c15c9c16e76a8f1d5035db). 

**Exchange rate: 1 ETH = 2 TER.** You can check TER token supply info [here](https://ropsten.etherscan.io/token/0xc26684cd4e334d8435c15c9c16e76a8f1d5035db).

### Cosmos Hub (development in progress)
[Cosmos](https://cosmos.network/) aims to build the "hubs-and-zones" to allow different blockchains interact with each other.

![Cosmos](https://github.com/wellkochi/Terra/blob/master/cosmos.jpg)

[Tendermint](https://tendermint.com/) is a software which can be used to achieve Byzantine fault tolerance (BFT) in any distributed computing platforms. Cosmos is build on top of Tendermint.

![Tendermint](https://github.com/wellkochi/Terra/blob/master/tendermint.png)

### DNF Wallet (mimic)
Like aforementioned, DNF is still under development, so we will create a blockchain to mimic Dfinity blockchain. 
Use MultiChain to create your own blockchain. Please proceed to [here](https://www.multichain.com/getting-started/).

---

## Notes:
**To prevent double-spending:** In example 1, as MultiChain states here:
> MultiChain also provides the `disablerawtransaction` API to disable an offer after it has been distributed. This works so long as nobody has yet accepted the offer by extending it into a balanced transaction and broadcasting that transaction to the network. An offer is disabled by spending the assets used in one of the offer’s inputs, sending them back to their source. At this point the offer becomes useless, because one of its inputs refers to a previously spent transaction output, which the blockchain’s double-spend rules prevent from being spent again.

In example 2, Cosmos hub requires its users to stake its native [Atom token](https://cosmos.network/docs/introduction/cosmos-hub.html#atoms) when interact with the hub, but there are not much information has been released yet. I assume Atoms and Photons will be used as a stake mechanism which prevent double-spending. If you have any info, please let me konw.

**Token exchange speed:**
I didn't find any info about this one. But I assume the speed in both Cosmos and Atomic Swap is constant. If you have any info, please let me konw.

**Security guarantees of a normal Ethereum transaction:**
This depends on both cross-chain protocol part and the other blockchain (in this case, Dfinify).
**Cross-chain protocol**: In example 1, Atomic Swap's mechanism ensures tokens are safe during the process. Atomic Swap has been used on some DEX and no accident has happened yet. Here is an video explains [how it works](https://youtu.be/C2Io5DoLGGc). 
In example 2, since Cosmos Hub is still under development, we cannot tell if the system is secure at the moment, and will need to wait for its release and battle-test it. If you have any info, please let me konw.
**Dfinity**: Since Dfnity is still under development, we cannot tell if the system is secure at the moment, and will need to wait for its release and battle-test it. If you have any info, please let me konw.

---

## Closing Thoughts:
Blockchain space is still early. Scalability and interoperability are definitely crucial factors for blockchain to reach the mainstream adoption. We are seeing many projects are being developed to solve these problems, but we need time to test them out. I am keeping my eyes on these projects mentioned before, and I have no doubt these problem will be solved since many talented developers are working on them. If you are a developer, I encourge you to join this. Now it is time for us developers to BUILD.


