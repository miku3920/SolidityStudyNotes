const Chat = artifacts.require('../contracts/Chat.sol')
const chai = require('chai')
const chai_as_promised = require('chai-as-promised')

chai.use(chai_as_promised).should()

contract('Chat', (accounts) => {
    let chat

    beforeEach(async () => {
        chat = await Chat.deployed()
        console.log('Deploy success!')
        console.log('Chat address:', chat.address)
    })

    it('get balance', async () => {
        const balance = await web3.eth.getBalance(accounts[0])
        console.log('balance[0]:', balance)
    })

    it('get message', async () => {
        const message = await chat.getMessage()
        console.log('Message:', message)
    })

    it('set massage and get again', async () => {
        await chat.setMessage('Changed!')

        const message = await chat.getMessage()
        console.log('Message:', message)

        const message_public = await chat.message()
        console.log('Message from public:', message_public)
    })
})
