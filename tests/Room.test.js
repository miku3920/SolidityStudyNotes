const assert = require('assert')
const Room = require('../src/Room')

describe('Room', () => {
    let room

    beforeEach(() => {
        room = new Room()
    })

    it('has an open function', () => {
        assert.strictEqual(room.open(), 'welcome')
    })

    it('hsa an close function', () => {
        assert.strictEqual(room.close(), '......')
    })
})
