var MultiHello = artifacts.require("./MultiHello.sol");
module.exports = function(deployer) {
  deployer.deploy(MultiHello);
};