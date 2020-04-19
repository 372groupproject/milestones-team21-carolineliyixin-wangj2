-- in file a:
-- We store all of the functions
-- into a table named operations, and
-- return the table in the end.
local operations =  {}

function operations.add(a,b)
   print(a+b)
end

function operations.sub(a,b)
   print(a-b)
end

function operations.mul(a,b)
   print(a*b)
end

function operations.div(a,b)
   print(a/b)
end

return operations	



-- In file b:
-- pass the table of functions from 
-- file a and use them in file b.
operator = require("operations")
operator.add(10,20)
operator.sub(30,20)
operator.mul(10,20)
operator.div(30,20)