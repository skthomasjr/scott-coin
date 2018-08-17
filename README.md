### Scott Coin (SKT) - Demo Ethereum ERC20 Token Contract
Scott Coin (SKT) is a minimal ERC20 token contract that has been deployed to the Ethereum mainnet. It was built to demonstrate the minimal implementation needed for a ERC20 token typically used in an ICO. The contract supports a fixed token supply and the minimum features to qualify as ERC20 compliant. 

### Development
Install the development environment dependencies. The is not absolutely required, but Truffle is useful for compilation checks and unit tests if the contract code becomes complex. 
```sh
npm i -g truffle
```
Create the directory structure and scaffolding to support the Truffle/Solidity project.
```sh
mkdir scott-coin
cd scott-coin
truffle init
```
Add the code for your ERC20 contract under the contracts folder created by Truffle. Make sure to update the initial migrations if you want to use Truffle for building and testing. To build and test use:
```
truffle test
```
### Deployment
The easiest (down & dirty) way to get a contract deployed to the Ethereum mainnet is to use [Remix IDE](https://remix.ethereum.org) with [MetaMask](https://metamask.io) browser plugin. Copy your contract code to Remix, unlock MetaMask and choose an account with ether to fund the contract deployment. You will receive your transaction ID immediately, but you will need to wait for an initial confirmation before getting your contract address.

### Scott Coin (SKT) Contract Address
```
0x1e2025e0a91df6e47867a3e52299cad71fe1a9db
```
Check it out at [Etherscan](https://etherscan.io/token/0x1e2025e0a91df6e47867a3e52299cad71fe1a9db) - I'm Rich!
 
