// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AnimationController from "./animation_controller.js"
application.register("animation", AnimationController)

import CardsController from "./cards_controller.js"
application.register("cards", CardsController)

import FindCompanyController from "./find_company_controller.js"
application.register("find-company", FindCompanyController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import MapController from "./map_controller.js"
application.register("map", MapController)

import SearchAssoController from "./search_asso_controller.js"
application.register("search-asso", SearchAssoController)

import SortableController from "./sortable_controller.js"
application.register("sortable", SortableController)
