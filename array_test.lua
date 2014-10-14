require 'test_util'
require 'lua.util.array'

local array

before_each(function()
	array = Array:new()
end)

test('Array', ':add', 'pushes the given object on to the end of array', function()
	array:add('element')
	assert_equal( array:size(), 1 )
	assert_equal( array:get(1), 'element' )
end)

test('Array', ':at', 'returns a element at given index (alias for :get)', function()
	array:add('element')
	array:add('element2')
	assert_equal( array:at(1), 'element' )
	assert_equal( array:at(2), 'element2' )
end)

test('Array', ':delete_if', 'deletes every element of array for which block evaluates to true', function()
	array:add(1)
	array:add(2)
	array:add(3)
	array:add(4)

	array:delete_if(function( element )
		return element > 2
	end)

	assert_equal( array:size(), 2 )
	assert_equal( array:get(1), 1 )
	assert_equal( array:get(2), 2 )
	assert_equal( array:get(3), nil )
end)

test('Array', ':each_do', 'calls the given block once for each element in array, passing that element as a parameter', function()
	local text = ''
	array:each_do(function( element )
		text = text..element
	end)
	assert_equal( text, '' )

	array:add(1)
	array:add(2)
	array:add(3)
	array:add(4)

	array:each_do(function( element )
		text = text..element
	end)

	assert_equal( text, '1234' )
end)

test('Array', ':get', 'returns a element at given index', function()
	array:add('element')
	array:add('element2')
	assert_equal( array:get(1), 'element' )
	assert_equal( array:get(2), 'element2' )
end)

test('Array', ':length', 'returns the number of elements in array (alias for :size)', function()
	array:add('element')
	assert_equal( array:length(), 1 )
	array:add('element2')
	array:add('element3')
	assert_equal( array:length(), 3 )
end)

test('Array', ':select_if', 'returns a new array containing all elements of array for which the given block returns a true value', function()
	array:add(1)
	array:add(2)
	array:add(3)
	array:add(4)

	local new_array = array:select_if(function( element )
		return element > 2
	end)

	assert_not_equal( new_array, array )
	assert_equal( new_array:size(), 2 )
	assert_equal( new_array:get(1), 3 )
	assert_equal( new_array:get(2), 4 )
end)

test('Array', ':size', 'returns the number of elements in array.', function()
	array:add('element')
	assert_equal( array:size(), 1 )
	array:add('element2')
	array:add('element3')
	assert_equal( array:size(), 3 )
end)


test('Array', ':delete_at', 'Deletes the element at the specified index, returning that element, or nil if the index is out of range.', function()
	array:add(1)
	array:add(2)
	array:add(3)
	array:add(4)
	array:add(5)
	removed_element = array:delete_at(3)
	assert_equal( array:size(), 4 )
	assert_equal( removed_element, 3 )
	assert_equal( array:at(3), 4)
end)

test('Array', ':is_empty', 'Returns true if array contains no elements.', function()
	assert_equal( array:is_empty(), true )

	array:add(1)
	assert_equal( array:is_empty(), false )
	
	array:delete_at(1)
	assert_equal( array:is_empty(), true )
end)

test('Array', ':first', 'Returns the first element.', function()
	assert_equal( array:first(), nil )

	array:add(1)
	array:add(2)

	assert_equal( array:first(), 1 )
end)