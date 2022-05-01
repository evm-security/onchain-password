const { expectEvent } = require('@openzeppelin/test-helpers');
const { expect } = require('chai');
const { ethers } = require("hardhat");
const keccak256 = require("keccak256");

function hashThis(_password)
{
  return "0x".concat(keccak256(_password).toString('hex'));
}

describe("Deploys and tests the contract ", function () {
  it("Should check password", async function () {
    const contractVar = await hre.ethers.getContractFactory("onChainPassword");
    const onChainPassword = await contractVar.deploy(hashThis("test1"));
    await onChainPassword.deployed();
  // const checkPass = await onChainPassword.callStatic._checkPassword(hashThis("test1"), hashThis("test2"));
  console.log(await onChainPassword.callStatic.constructorGet());
  // console.log(await onChainPassword.callStatic._checkPassword(hashThis("test1"), hashThis("test2")));
  //  expect(checkPass[0]).to.equal(true);
  });
});
