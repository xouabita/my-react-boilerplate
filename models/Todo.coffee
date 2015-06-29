mongoose = require 'mongoose'

{ Schema } = mongoose

Todo = new Schema
  text: String
  author: type: Schema.Types.ObjectId, ref: 'User'

module.exports = mongoose.model 'Todo', Todo
