var ico = artifacts.require("ICOToken");
module.exports = function(deployer) {
  deployer.deploy(ico, 'Dragon', 18, 'DGN', 1000000000);
};
