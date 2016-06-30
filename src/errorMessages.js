const messages = {
  SyntaxError: "Tem um problema na linha #LINE_NUMBER e entre as colunas #COL_START e #COL_END. Tem um #FOUND ali, mas deveria ter #EXPECTED."
}
module.exports = (() => {
  return {
    syntaxError: (lineNumber, colStart, colEnd, found, expected) => {
      return messages.SyntaxError
        .replace("#LINE_NUMBER", lineNumber)
        .replace("#COL_START", colStart)
        .replace("#COL_END", colEnd)
        .replace("#FOUND", found)
        .replace("#EXPECTED", expected.reduce((previou, current, index) => index == 0 ? current : previous + " ou " + current ));
    }
  }
})()
