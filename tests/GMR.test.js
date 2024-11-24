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

})
