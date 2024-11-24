const CAC = artifacts.require('CAC')

module.exports = (deployer) => {
    deployer.deploy(CAC, 200)
}
