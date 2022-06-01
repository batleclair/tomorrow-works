// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CardsController from "./cards_controller.js"
application.register("cards", CardsController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import SearchAssoController from "./search_asso_controller.js"
application.register("search-asso", SearchAssoController)
