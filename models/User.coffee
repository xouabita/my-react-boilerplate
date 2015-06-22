mongoose              = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
{ Schema }            = mongoose

User = new Schema
  username: String
  password: String
User.plugin passportLocalMongoose

module.exports = mongoose.model 'User', User
