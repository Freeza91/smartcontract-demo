var ico = artifacts.require("ICOToken");
module.exports = function(deployer) {
  // https://abi.hashex.org/ for constructor abi
  deployer.deploy(ico, 'Dragon', 18, 'DGN', 1000000000);
};
