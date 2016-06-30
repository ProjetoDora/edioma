let PEG = require('pegjs')
let requireText = require('require-text')
let grammar = requireText('./edioma.pegjs', require)
let errorMessages = require('./errorMessages')

let parser = PEG.buildParser(grammar)

module.exports = {
  run: (source) => {
    try {
      let result = parser.parse(source)
      return result.eval()
    } catch (e) {
      if (e instanceof parser.SyntaxError)
        throw new Error(errorMessages.syntaxError(e.location.start.line, e.location.start.column, e.location.end.column, e.found, e.expected.map((i) => i.description)))
    }
  }
}
