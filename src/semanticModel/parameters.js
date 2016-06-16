
module.exports = function(parameters) {
  return {
    eval: () => {
      return parameters.map((param) => param.eval())
    }
  }
}
