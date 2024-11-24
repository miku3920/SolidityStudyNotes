const GMR = artifacts.require('../contracts/GMR.sol')
const chai = require('chai')
const chai_as_promised = require('chai-as-promised')

chai.use(chai_as_promised).should()

contract('GMR', (accounts) => {
    let gmr

    beforeEach(async () => {
        gmr = await GMR.new({
            from: accounts[0],
        })

        console.log('New GMR!')
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
            value: web3.utils.toWei('0.1', 'ether'),
        })

        const players = await gmr.getCurrentPlayers()
        console.log(players)

        assert.strictEqual(players.length, 1)
        assert.strictEqual(players[0], accounts[1])
    })

    it('multiple enter', async () => {
        const joined = [accounts[1], accounts[2], accounts[3]]
        for (let account of joined) {
            await gmr.enterGame({
                from: account,
                value: web3.utils.toWei('0.1', 'ether'),
            })
        }

        const players = await gmr.getCurrentPlayers()
        console.log(players)

        assert.strictEqual(players.length, 3)

        players.forEach((player, i) => {
            assert.strictEqual(player, accounts[i + 1])
        })
    })

    it('not enough ether should raise fail', async () => {
        try {
            await gmr.enterGame({
                from: accounts[1],
                value: web3.utils.toWei('0.01', 'ether'),
            })

            assert(false);
        } catch (err) {
            console.log(err.message)

            assert.isAbove(
                err.message.search('VM Exception while processing transaction'),
                -1,
                'VM Exception should happen'
            )
        }
    })

    it('only manager can draw', async () => {
        try {
            await gmr.enterGame({
                from: accounts[1],
                value: web3.utils.toWei('0.3', 'ether'),
            })

            await gmr.drawAndPayMoneyToWinner({
                from: accounts[1],
            })

            assert(false);
        } catch (err) {
            console.log(err.message)

            assert.isAbove(
                err.message.search('VM Exception while processing transaction'),
                -1,
                'VM Exception should happen'
            )
        }
    })
})
