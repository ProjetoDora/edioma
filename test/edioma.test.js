let expect = require('chai').expect
let edioma = require('../src/edioma')

describe('Function Call', () => {
  it('runs language expression', () => {
    let result = edioma.run('envia("Oi")\n')   
    expect(result).to.equal('envia("Oi")')
  })

  it('creates a specific message for a error', () => {
    const exception = "Parece que você não fechou as aspas"
    expect(() => edioma.run('envia("Oi)\n')).to.throw(Error, exception)
  })
})
