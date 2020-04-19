local function checkrange(a,b,n)
	if not n > b and n < a then error("Not in range") end
end

local function new(a,b) 
	return {a = a}
end

local function check(a,b,n)
	checkrange(a,b,n);
	return new(n)
end

complex = {
	new = new
	check = check
}



