# cough

It's pleasant to write CoffeeScript in snake case style, but module consumers are more than likely using plain JavaScript and expecting camel cased method names. 

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
var theModule = require("coffee-script-file-above")

// these work
theModule.someMethodHere();
theModule.anotherMethodHere();
```


