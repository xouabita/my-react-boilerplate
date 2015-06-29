request     = require 'superagent'
{ Promise } = require 'es6-promise'

Api =
  get: (url) ->
    new Promise (resolve, reject) ->
      request
        .get url
        .end (err, res) ->
          reject() if res.status >= 400
          resolve JSON.parse res.text

  post: (url, data) ->
    new Promise (resolve, reject) ->
      request
        .post url
        .send data
        .set 'Content-Type', 'application/json'
        .end (err, res) ->
          reject() if res.status >= 400
          resolve JSON.parse res.text

  delete: (url) ->
    new Promise (resolve, reject) ->
      request
        .del url
        .end (err, res) ->
          reject() if err or res.status >= 400
          resolve()

module.exports = Api
