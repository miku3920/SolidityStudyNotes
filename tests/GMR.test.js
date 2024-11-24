const GMR = artifacts.require('../contracts/GMR.sol')
const chai = require('chai')
const chai_as_promised = require('chai-as-promised')

chai.use(chai_as_promised).should()

contract('GMR', (accounts) => {
    let gmr

    beforeEach(async () => {
        gmr = await GMR.deployed()
        console.log('Deploy success!')
        console.log('GMR address:', gmr.address)
    })

    it('get balance', async () => {
        const balance = await web3.eth.getBalance(accounts[0])
        console.log('balance[0]:', balance)
    })

    it('deployed a contract', () => {
        assert.ok(gmr.address)
    })

    it('get GMR balance', async () => {
        const balance = await gmr.getBalance()
        console.log('GMR balance:', balance)
    })

    it('enter game', async () => {
        await gmr.enterGame({
            from: accounts[1],
            value: web3.utils.toWei('0.1', 'ether')
        })

        const players = await gmr.getCurrentPlayers()
        console.log(players)
        assert.strictEqual(players[0], accounts[1])
        assert.strictEqual(players.length, 1)
    })
})
