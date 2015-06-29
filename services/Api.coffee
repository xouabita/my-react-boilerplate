request     = require 'superagent'
{ Promise } = require 'es6-promise'

Api =
  get: (url) ->
    new Promise (resolve, reject) ->
      request
        .get url
        .end (res) ->
          reject() if res.status >= 400
          resolve JSON.parse res.text

  post: (url, data) ->
    new Promise (resolve, reject) ->
      request
        .post url
        .send data
        .set 'Content-Type', 'application/json'
        .end (res) ->
          reject() if res.status >= 400
          resolve()

  delete: (url) ->
    new Promise (resolve, reject) ->
      request
        .delete url
        .end (res) ->
          reject() if res.status >= 400
          resolve()

module.exports = Api
