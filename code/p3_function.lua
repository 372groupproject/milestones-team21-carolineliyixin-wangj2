-- function compute the sum of even number for 0 to the given number
-- call function use print(sum_even(n)) when test it
function sum_even(n)
	if n == 0 then 
		return n
	else
		if n % 2 == 0 then 
			return n + sum_even(n-1)
		else
			return sum_even(n-1)
		end
	end
end
