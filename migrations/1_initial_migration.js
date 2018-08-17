var Migrations = artifacts.require("./Migrations.sol");
var ScottCoin = artifacts.require("./ScottCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(ScottCoin);
};
