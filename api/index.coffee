express = require 'express'
router  = express.Router()

router.use '/todo/', require './todo.coffee'

module.exports = router
