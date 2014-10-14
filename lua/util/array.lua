Array = {}
Array.class_name = 'Array'

function Array.new()
	local array = {}
	local _elements = {}
	local _class = Array

	function array:add( element )
		_elements[#_elements + 1] = element
	end

	function array:get( index )
		return _elements[ index ]
	end

	function array:at( index )
		return self:get( index )
	end

	function array:each_do( yield )
		for i = 1, #_elements do
			yield( _elements[i] )
		end
	end

	function array:select_if( yield )
		local selected_elements = Array.new()
		for i = 1, #_elements do
			local element = _elements[i]
			if yield( element ) then
				selected_elements:add( element )
			end
		end
		return selected_elements
	end

	function array:delete_if( yield )
		local self_size = #_elements
		for i = 1, self_size do
			local element = _elements[i]
			if yield( element ) then
				_elements[i] = nil
			end
		end
		
		self:_compact( self_size )
	end

	function array:delete_at( index )
		local self_size = #_elements
		local removed_element = _elements[index]
		if removed_element then
			_elements[index] = nil
			self:_compact( self_size )
		end
		return removed_element
	end

	function array:_compact( max_length )
		local max_length = max_length
		for i = 1, max_length do
			if _elements[i] == nil then
				for j = i + 1, max_length do
					if _elements[j] ~= nil then
						_elements[i], _elements[j] = _elements[j], _elements[i]
						break
					end
				end
			end
		end
	end

	function array:size()
		return #_elements
	end

	function array:length()
		return self:size()
	end

	function array:is_empty()
		return #_elements == 0
	end

	return array
end

return Array