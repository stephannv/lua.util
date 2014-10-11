lua.util
========
lua.util is a module with some convenient utilities not included with the standard Lua install.


###Array
######Description
Arrays are ordered, integer-indexed collections of any object.

######Basic Usage

Add 'lua' folder to your project and use `require 'lua.util.array'` at the top of your file or in `main.lua(Corona SDK project)`. 

========
An array is created using `#new`
```Lua
array = Array.new()
```
========

Elements can be inserted using `:add`
```Lua
array = Array.new()

array:add('element')
array:add(3)
array:add({})
array:add(function() end)
```

========

`:at` and `:get` is used to retrieve an element at a given position
```Lua
array = Array:new()

array:add('element')
array:add(3)

array:get(1) --returns 'element'
array:at(2) --returns 3
```
========

Use `:size` and `:length` to get the number of elements in array
```Lua
array = Array:new()

array:size() --returns 0

array:add('element 1')
array:add('element 2')

array:length() --returns 2
```

========

`:each_do` executes code for each element in collection
```Lua
array = Array:new()

array:add(1)
array:add(2)
array:add(3)
array:add(4)

total = 0

array:each_do(function(element)
  total = total + element
end)

print(total) --prints '10'
```

========

`:select_if` returns a new array containing all elements of array for which the given block returns a true value
```Lua
array = Array:new()

array:add(1)
array:add(2)
array:add(3)
array:add(4)

new_array = array:select_if(function(element)
  return element > 2
end)

new_array:get(1) --returns '3'
new_array:get(2) --returns '4'
```
========

`:delete_if` deletes every element of self for which block evaluates to true
```Lua
array = Array:new()

array:add(1)
array:add(2)
array:add(3)
array:add(4)

array:delete_if(function(element)
  return element < 3
end)

array:get(1) --returns '3'
array:get(2) --returns '4'
```

##under construction...
