# cough [![Build Status](https://travis-ci.org/nickb1080/cough.svg?branch=master)](https://travis-ci.org/nickb1080/cough)

It's pleasant to write CoffeeScript in snake case style, but module consumers are more than likely using plain JavaScript and expecting camel cased method names. 

This module requires an environment supporting [Proxies](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy).

CoffeeScript

```coffeescript
cough = require "cough"
fs = cough require "fs"

# this works
data = fs.read_file_sync("some-file.json")

# or maybe export something snake cased
module.exports = 
  some_method_here: -> # ...
  another_method_here: -> # ...
```

JavaScript (importing the exported object above)
```js
var cough = require("cough");
var theModule = cough(require("coffee-script-file-above"));

// these work
theModule.someMethodHere();
theModule.anotherMethodHere();
```


