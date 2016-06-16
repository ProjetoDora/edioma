
module.exports = function(id, params) {
  return {
    eval: () => {
      return id.eval() + '(' + params.eval() + ')'
    }
  }
}
