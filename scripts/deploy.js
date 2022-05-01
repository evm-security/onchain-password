const hre = require("hardhat");
const keccak256 = require("keccak256");

function hashFunction(_password)
{
  return "0x".concat(keccak256(_password).toString('hex'));
}

async function main() {
  const contractVar = await hre.ethers.getContractFactory("onChainPassword");
  const onChainPassword = await contractVar.deploy(hashFunction("test1"));

  await onChainPassword.deployed();

  console.log("Contract deployed to:", onChainPassword.address);
  console.log(hashFunction("hey"));
  console.log(await onChainPassword._checkPassword(hashFunction("test1"), hashFunction("test2")));
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
