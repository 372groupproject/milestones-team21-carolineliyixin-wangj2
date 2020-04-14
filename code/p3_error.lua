-- assert() check error
m = "s"
n = 1
function sum(m,n)
	assert(type(n) == "number")
	assert(type(m) == "number")
	return m + n
end

-- error handling function xpcall()
function error_check()
   n = n/nil
end

function error_handle( err )
   print( "ERROR:", err )
end

errors = xpcall( error_check, error_handle )
print( errors)

