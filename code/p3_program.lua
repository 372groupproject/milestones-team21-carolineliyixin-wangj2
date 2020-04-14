-- this small program is to compute the number of string which user decide in the table
local table = {"apple", "orange", "apple","pear","orange","apple"}
sum = 0
function number_table(x)
	for key,val in pairs(table) do
		if val == x then
			sum = sum + 1
		end
	end
	print(x .. ":" .. sum)
	sum = 0
end