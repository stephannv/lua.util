local set_up = function() end

function assert_equal( arg1, arg2 )
	if arg1 == arg2 then
		print('', '', '.')
	else
		print('', '', 'FAIL')
		print('', '','', 'Arg1: ', arg1, 'Arg2: ',arg2 )
	end
end

function assert_not_equal( arg1, arg2 )
	if arg1 ~= arg2 then
		print('', '', '.')
	else
		print('', '', 'FAIL')
		print('', '','', 'Arg1: ', arg1, 'Arg2: ',arg2 )
	end
end

function test( class_name, func_name, test_description, yield )
	print( class_name, func_name, test_description )
	set_up()
	yield()
end

function before_each( yield )
	set_up = yield
end