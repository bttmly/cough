unless global.Proxy and typeof Proxy isnt "undefined"
  throw new Error "Unsupported platform."

Reflect = require "harmony-reflect"
camel_case = require "camel-case"
snake_case = require "snake-case"
is_primitive = require "is-primitive"

cases = (s) -> [camel_case(s), snake_case(s)]

handler =
  has: (target, prop) ->
    [camel, snake] = cases prop
    if Reflect.has target, prop  then return true
    if Reflect.has target, camel then return true
    if Reflect.has target, snake then return true
    false

  get: (target, prop) ->
    [camel, snake] = cases prop
    if Reflect.get target, prop  then return target[prop]
    if Reflect.get target, camel then return target[camel]
    if Reflect.get target, snake then return target[snake]


module.exports = cough = (obj) ->
  if is_primitive(obj) then throw new TypeError "cough doesn't accept primitive values"
  new Proxy obj, handler
