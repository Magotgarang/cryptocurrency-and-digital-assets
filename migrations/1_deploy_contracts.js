const DigitalAssetManager = artifacts.require("DigitalAssetManager");

module.exports = function (deployer) {
  deployer.deploy(DigitalAssetManager);
};
