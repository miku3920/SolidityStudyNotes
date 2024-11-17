const assert = require('assert')
const ganache = require('ganache-cli')
const { Web3 } = require('web3')
const web3 = new Web3(ganache.provider())

describe('Chat', () => {
    let accounts

    beforeEach(async () => {
        accounts = await web3.eth.getAccounts()
    })

    it('get balance', async () => {
        const balance = await web3.eth.getBalance(accounts[0])
        console.log('balance[0]:', balance);

    })

    it('get accounts', () => {
        console.log('accounts[0]:', accounts[0]);
    })

})
