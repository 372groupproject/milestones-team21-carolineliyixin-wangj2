--example 1: numeric for
                               --syntax
for i = 0, 10, 2 do            --for var=exp1,exp2,exp3 do
	print("hello world")         --   statement
end                            --end

--example 2: generic for
days = {"Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"}

for i,v in pairs(days) do
  print(i,v)
end