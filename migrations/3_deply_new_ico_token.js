var ico = artifacts.require("ICOToken");
module.exports = function(deployer) {
  // https://remix.ethereum.org
  deployer.deploy(ico);
};
