-- In file named a.lua, we implement a simple function
M = {}
function M.add10(a) return (a + 10) end
return M -- This return is not necessary

-- Now in file b.lua, we want to introduce the function
-- add10 written in package M in a.lua
M_a = require("a")
print(M_a.add10(10))  -- will print 20

-- Note that require key word depend on file name, 
-- NOT package Name.