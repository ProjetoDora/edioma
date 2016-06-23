let PEG = require('pegjs')
let requireText = require('require-text')
let grammar = requireText('./edioma.pegjs', require)

let parser = PEG.buildParser(grammar)

module.exports = {
  run: (source) => {
    try {
      let result = parser.parse(source)
      return result.eval()
    } catch (e) {
      if (e instanceof parser.SyntaxError)
        throw new Error("Parece que você não fechou as aspas")
    }
  }
}
