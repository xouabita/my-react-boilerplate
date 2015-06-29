express = require 'express'
router  = express.Router()
Todo    = require '../models/Todo.coffee'

User    = require '../models/User.coffee'

router.get '/', (req, res) ->
  if not req.user then res.sendStatus 403
  Todo.find author: req.user.id, (err, todos) ->
    res.json todos if not err
    res.status 500

router.post '/', (req, res) ->
  if not req.user then res.sendStatus 403
  todo = new Todo
    author: req.user.id
    text: req.body.text
  todo.save()
  res.json todo

router.delete '/:id', (req, res) ->
  if not req.user then res.sendStatus 403
  Todo.findOne _id: req.params.id, (err, todo) ->
    res.status 500 if err
    todo.delete()
    res.status 200

module.exports = router
