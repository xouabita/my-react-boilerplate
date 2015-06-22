mongoose              = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
{ Schema }            = mongoose

User = new Schema name: String
User.plugin passportLocalMongoose

module.exports = mongoose.model 'User', User
