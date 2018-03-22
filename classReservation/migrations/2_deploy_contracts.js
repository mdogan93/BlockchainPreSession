var classReservation = artifacts.require("./classReservation.sol");
module.exports = function(deployer) {
  deployer.deploy(classReservation);
};