let PEG = require('pegjs')
let expect = require('chai').expect
let fs = require('fs')

describe('Function Call', () => {
  it('parses parameters to array', ()=> {
    let grammar = fs.readFileSync('src/edioma.pegjs', 'utf-8')
    let parse = PEG.buildParser(grammar).parse 
    let parsedArray = parse('(a b b)')
    let expectedArray = ['a', 'b', 'b']

    expect(parsedArray).to.deep.equal(expectedArray)
  })  
})
