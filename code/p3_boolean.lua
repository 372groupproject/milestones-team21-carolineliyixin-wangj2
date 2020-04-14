-- the type of boolean
print(type(false))
print(type(true))

-- the operation
if false then
	print("false")
else
	print("true")
end

-- nil is the same as false in lua 
if nil then
	print("false")
else
	print("true")
end

-- 0 is the same as true in lua
if 0 then 
	print("true")
else
	print("false")
end