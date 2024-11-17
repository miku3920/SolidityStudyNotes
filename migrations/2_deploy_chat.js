const Chat = artifacts.require('Chat')

module.exports = (deployer) => {
    deployer.deploy(Chat, 'Hello, World!')
}
