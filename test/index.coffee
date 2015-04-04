cough = require "../src"
assert = cough require "assert"

error_re = /cough doesn't accept primitive values/

describe "works", ->
  it "works for getting properties", ->
    assert.equal assert.not_deep_equal, assert.notDeepEqual

  it "works for checking for property existence", ->
    assert.equal "notDeepEqual" of assert, true
    assert.equal "not_deep_equal" of assert, true

    assert.equal "noSuchProperty" of assert, false
    assert.equal "no_such_property" of assert, false

  it "works for added camelCase props (duh)", ->
    o = cough {}
    o.newPropertyName = "asdf"
    assert.equal o.newPropertyName, "asdf"
    assert.equal o.new_property_name, "asdf"

  it "works for added snake_case props (duh)", ->
    o = cough {}
    o.new_property_name = "asdf"
    assert.equal o.newPropertyName, "asdf"
    assert.equal o.new_property_name, "asdf"

  it "throws when passed a primitive", ->
    assert.throws (-> cough "string"), error_re
    assert.throws (-> cough true), error_re
    assert.throws (-> cough 1234), error_re
    if typeof Symbol isnt "undefined"
      assert.throws (-> cough do Symbol), error_re
