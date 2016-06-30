let expect = require('chai').expect
let edioma = require('../src/edioma')

describe('Function Call', () => {
  it('runs language expression', () => {
    let result = edioma.run('envia("Oi")\n')   
    expect(result).to.equal('envia("Oi")')
  })

  it('display a syntax error informing location the location and the message in portugues.', () => {
    const exception = "Tem um problema na linha 1 e entre as colunas 7 e 8. Tem um \" ali, mas deveria ter literal de texto."
    expect(() => edioma.run('envia("Oi)\n')).to.throw(Error, exception)
  })
})
