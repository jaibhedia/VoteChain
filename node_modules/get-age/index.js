'use strict'

// http://stackoverflow.com/questions/4060004/calculate-age-in-javascript/7091965#7091965
module.exports = function getAge (dateString) {
  var today = new Date()
  var birthDate = new Date(dateString)
  var age = today.getUTCFullYear() - birthDate.getUTCFullYear()
  var month = today.getUTCMonth() - birthDate.getUTCMonth()
  if (month < 0 || (month === 0 && today.getUTCDate() < birthDate.getUTCDate())) {
    age--
  }
  return age
}
