const assert = require('assert')
const Room = require('../src/Room')

describe('Room', () => {
    let r1
    beforeEach(() => {
        r1 = new Room
    })

    it('has an open function', () => {
        assert.strictEqual(r1.open(), 'welcome')
    })

    it('hsa an close function', () => {
        assert.strictEqual(r1.close(), '......')
    })

})
