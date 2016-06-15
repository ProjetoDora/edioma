let PEG = require('pegjs')
let fs = require('fs')

let grammar = fs.readFileSync('src/edioma.pegjs', 'utf-8')
let parse = PEG.buildParser(grammar).parse 

module.exports = {
  run: (source) => {
    return parse(source)
  }
}

