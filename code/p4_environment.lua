-- A concise solution
local P = {}
pack = P
local _G = _G
setfenv(1, P)


-- A better solution
local P = {}
pack = P

-- Import Section:
-- Only declare what this package needs from outside
local sqrt = math.sqrt
local io = io

-- no more external access after this point
setfenv(1, P)