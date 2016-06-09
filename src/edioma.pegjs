FunctionCall
  = id:IDENTIFIER _ "(" _ list:ParameterList _ ")" NEWLINE {
    return id + '(' + list + ')'
  }

ParameterList
  = first:Parameter tail:( _ Parameter )* {
      return [first].concat(tail.map((e) => e[1]))
  }

Parameter 
  = STRING_LITERAL 

IDENTIFIER
  = [a-zA-Z]+ { return text() }

STRING_LITERAL
  = '"' [a-zA-Z]+ '"' { return text() }
  
NEWLINE 
  = [\n(\r)?]+

_ "whitespace"
  = [ \t]*
  
