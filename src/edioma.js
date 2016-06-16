let PEG = require('pegjs')
let requireText = require('require-text')
let grammar = requireText('./edioma.pegjs', require)

let parse = PEG.buildParser(grammar).parse 

module.exports = {
  run: (source) => {
    return parse(source)
  }
}
