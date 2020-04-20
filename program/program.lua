-- This program is like the game "2048". 
-- The rule of this game is you need to control all the blocks to move in the same direction. 
-- Two blocks with the same number collide and merge into their sum. 
-- After each operation, a 2 or 4 will be randomly generated. 
-- Finally, a "2048" block is won.
-- You can keep play the game to get multiple of 2048 until the gameover.

-- create the grid for the game
local function creatGrid()
	local grid = {}
	for i = 1, 4 do
		if not grid[i] then 
			grid[i] = {}
		end
		for j = 1, 4 do
			grid[i][j] = 0
		end
	end
	return grid
end
-- initialized the grid with two "2" on the ramdom position of grid
local function initGrid(grid)
		local row1 = math.random(1,4)
		local row2 = math.random(1,4)
		local col1 = math.random(1,4)
		local col2 = math.random(1,4)
		grid[row1][col1] = 2
		grid[row2][col2] = 2
end
-- ramdom a number on the ramdom position after one time move
local function randomNum(grid)
	local number = {2, 4}
	local value = math.random(1,2)
	local n = math.random(1,4)
	local m = math.random(1,4)
	-- print(n)
	-- print(m)
	-- print(grid[n][m])
	while(grid[n][m] ~= 0) do
		local n = math.random(1,4)
		local m = math.random(1,4)
		-- print("row", n)
		-- print("col", m)
	end
	grid[n][m] = value
	-- print("value=",grid[n][m])
end

-- if the grid is full and can't move then gameover
local function gameOver(grid)
	local row = 1
	local col = 1
	for i = 1, 4 do
		row = i
		for j =1, 4 do
			col = j
			if grid[i][j] == 0 then 
				break
			end
		end		
	end
	if row == 4 and col == 4 then 
		print("gameover")
	end
end

-- if get 2048 or multiple of 2048 then print the message
local function getGoal(grid)
	for i = 1, 4 do
		for j = 1, 4 do
			local r = grid[i][j] % 2048
			if grid[i][j] ~= 0 and r == 0 then 
				print("You got", grid[i][j])
				break
			end
		end
	end
end
-- print grid
local function printGrid(grid)
	for i = 1, 4 do
		for j = 1, 4 do
			if grid[i][j] == 0 then
				grid[i][j] = " "
			end
		end
	end

	for i = 1, 4 do

		local x = table.concat( grid[i], " | " )
		print(x)
	end
end

-- main function 
local function main()
	local grid = creatGrid()
	initGrid(grid)	
	randomNum(grid)
	printGrid(grid)
	gameOver(grid)
	-- grid[1][1] = 2048
	getGoal(grid)

end
main()
