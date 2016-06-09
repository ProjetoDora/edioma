Expression 
  = "(" list:ParameterList ")" { return list }

ParameterList
  = first:Parameter tail:( WS Parameter )+ {
      let result = [first].concat(tail.map((e) => e[1]))
      return result
  }

Parameter 
  = [a-z] { return text() }
  
WS
  = [ \t\r]*

