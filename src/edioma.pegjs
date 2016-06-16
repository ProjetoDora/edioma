{
  var functionCall = require('../../../src/semanticModel/functionCall.js')
  var identifier = require('../../../src/semanticModel/identifier.js')

  var stringLiteral = require('../../../src/semanticModel/stringLiteral.js')
  var parameters = require('../../../src/semanticModel/parameters.js')
}

FunctionCall
  = id:IDENTIFIER _ "(" _ parameters:Parameters _ ")" NEWLINE {
    return functionCall(id, parameters)
  }

Parameters
  = first:Parameter tail:( _ COMMA _ Parameter )* {
      return parameters([first].concat(tail.map((e) => e[3])))
  }

Parameter 
  = STRING_LITERAL 

IDENTIFIER
  = [a-zA-Z]+ { return identifier(text()) }

STRING_LITERAL
  = '"' [a-zA-Z]+ '"' { return stringLiteral(text()) }
  
NEWLINE 
  = [\n(\r)?]+

COMMA
  = ','

_ "whitespace"
  = [ \t]*
