let PEG = require('pegjs')
let expect = require('chai').expect
let fs = require('fs')

describe('Function Call', () => {
  it('translates to a function call', ()=> {
    let grammar = fs.readFileSync('src/edioma.pegjs', 'utf-8')
    let parse = PEG.buildParser(grammar).parse 
    let origin = 'envia("Oi")\n'
    let target = 'envia("Oi")'

    expect(parse(origin)).to.equal(target)
  })  
})
