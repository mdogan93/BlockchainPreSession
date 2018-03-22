var payToWin = artifacts.require("./payToWin.sol");
module.exports = function(deployer) {
  deployer.deploy(payToWin);
};