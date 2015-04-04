unless global.Proxy and typeof Proxy isnt "undefined"
  throw new Error "Unsupported platform."

Reflect = require "harmony-reflect"
camel_case = require "camel-case"
snake_case = require "snake-case"
is_primitive = require "is-primitive"

cases = (s) -> [
  camel_case s
  snake_case s
]

handler =
  has: (target, prop) ->
    if Reflect.has target, prop  then return true
    [camel, snake] = cases prop
    if Reflect.has target, camel then return true
    if Reflect.has target, snake then return true
    false

  get: (target, prop) ->
    if Reflect.has target, prop  then return Reflect.get target, prop
    [camel, snake] = cases prop
    if Reflect.has target, camel then return Reflect.get target, camel
    if Reflect.has target, snake then return Reflect.get target, snake

module.exports = cough = (obj) ->
  if is_primitive(obj) then throw new TypeError "cough doesn't accept primitive values"
  new Proxy obj, handler
