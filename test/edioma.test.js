let expect = require('chai').expect
let edioma = require('../src/edioma')

describe('Function Call', () => {
  it('runs language expression', () => {
    let result = edioma.run('envia("Oi")\n')   
    expect(result).to.equal('envia("Oi")')
  })
})
