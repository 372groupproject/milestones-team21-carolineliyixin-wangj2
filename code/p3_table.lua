-- create a table
local table1 = {"Monday","Tuesday", "Wednesday", "Thursday", "Friday"}

-- Traverse the table and print it
for key,val in pairs(table1) do
	print(key .. ":" .. val)
end

-- operation for table
-- instert
table.insert(table1,1,"Sunday")

-- delete
table.remove(table1,2)

-- sort the table
table.sort(table1)

-- Print with specified situation
print(table.concat(table1, ",", 1, 5))




