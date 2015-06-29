My React Boilerplate
====================

The perfect kickstarter app for React.

Features
--------

- Live reloading for frontend
- Nodemon for backend
- [passportjs](http://passportjs.org/) for authentification
- [react-router](https://github.com/rackt/react-router) for the routes
- Stylus and coffeescript. Enjoy editing your jsx components w/ [coffee-react](https://github.com/jsdf/coffee-react)
- Bootstrap w/ [react-bootstrap](http://react-bootstrap.github.io/) & [bootstrap-styl](https://github.com/maxmx/bootstrap-stylus)
- MongoDb w/ [mongoose](http://mongoosejs.com/)

Structure
---------

~~~bash
.
├── AppDispatcher.coffee            # Dispatcher for Flux architecture
├── README.md                       # You are reading me right now !
├── Routes.coffee                   # Routes defined for react-router
├── actions                         # Actions for Flux architecture
│   └── TodoActions.coffee
├── api                             # Backend API
│   ├── index.coffee
│   └── todo.coffee
├── assets                          # Your assets
│   ├── imgs
│   │   └── bg.gif
│   └── styles                      # Stylesheets, written in stylus
│       ├── _mixins.styl
│       ├── _page.styl
│       ├── _todo.styl
│       └── main.styl
├── components                      # Your components
│   ├── BackAlpha.coffee            # Example of component
│   ├── Page.coffee                 # Page component. Contains your app.
│   └── Todo
│       ├── Input.coffee
│       ├── Item.coffee
│       ├── List.coffee
│       └── index.coffee
├── constants                       # Constants for flux architecture
│   └── TodoConstants.coffee
├── gulpfile.coffee                 # Gulp. To build everything.
├── models                          # Your mongoose models there
│   ├── Todo.coffee
│   └── User.coffee
├── package.json
├── server.coffee                   # Your backend application
├── services
│   └── Api.coffee                  # Helper to do API calls
├── stores                          # Stores for Flux architecture
│   └── TodoStore.coffee
├── views                           # Your views. Coffee files are react view.
│   ├── Hello.coffee
│   ├── Index.coffee
│   ├── Login.coffee
│   ├── Register.coffee
│   ├── TestLogin.coffee
│   ├── Todo.coffee
│   └── base.html                   # Used to render react on server side.
├── web.coffee                      # Frontend application
└── webpack.config.coffee           # Your webpack configuration
~~~
