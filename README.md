### Why is it needed?
Suppose you have locked liquidity on-contract which can be liquidated via `withdraw()` that depends on a require function and access control. If someone has access to the responsible EOA, they can withdraw funds when needed. A better way to go about this is to also have a password, so that incase of a private key leak, the hacker still has to enter a password. 

### How is it implemented? 
0. User enters password, gets hashed via Keccak256 and appended with "0x" before the hash string.
1. User sets password via constructor when deploying (`_setNewPassword()`)
2. User then can decide to check password (`_testPassword()`) and enter expected password and new password (since current password will be declared by on-chain data).

### Deploy and test

```
npx hardhat run --network localhost scripts/deploy.js
npx hardhat test
```
