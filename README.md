lua.util
========
lua.util is a module with some convenient utilities not included with the standard Lua install.

###Array
######Description
Arrays are ordered, integer-indexed collections of any object.

######Basic Usage
An array is created using `#new`
```Lua
array = Array.new()
```
Elements can be inserted using `:add`
```Lua
array:add('element')
array:add(3)
array:add({})
array:add(function() end)
```
`:at` and `:get` is used to retrieve an element at a given position
```Lua
array:get(1) --returns 'element'
array:at(2) --returns 3
```

##under construction...
