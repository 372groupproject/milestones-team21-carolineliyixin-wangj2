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
local function createNum(grid)
	local number = {2, 4}
	local value = math.random(1,2)
	local n = math.random(1,4)
	local m = math.random(1,4)
	if grid[n][m] ~= 0 then
		while grid[n][m] ~= 0 do
			local n = math.random(1,4)
			local m = math.random(1,4)
			if grid[n][m] == 0 then
				grid[n][m] = number[value]
				break
			end
		end
	else
		grid[n][m] = number[value]
	end
end

-- if the grid is full and can't move then gameover
local function gameOver(grid)
	local gameover = 0
	local count = 0 
	local row = 1
	local col = 1
	for i = 1, 4 do
		row = i
		for j =1, 4 do
			col = j
			if grid[i][j] == 0 then 
				count = count + 1
			end
		end		
	end
	if count == 0 then 
		print("gameover")
		gameover = 1
		return gameover
	end
end

-- if get 2048 or multiple of 2048 then print the message
local function getGoal(grid)
	local win = 0
	for i = 1, 4 do
		for j = 1, 4 do
			if grid[i][j] == 2048 then 
				win = 1
				print("You got", grid[i][j])
				break
			end
		end
	end
	return win
end
-- print grid
local function printGrid(grid)
	local printG = {}
	for i = 1, 4 do
		if not printG[i] then 
			printG[i] = {}
		end
		for j = 1, 4 do
			if grid[i][j] == 0 then
				printG[i][j] = " "
			else
				printG[i][j] = grid[i][j] 
			end
		end
	end

	for i = 1, 4 do
		local x = table.concat( printG[i], "	|	" )
		print(x)
	end
end
-- move left
local function moveLeft(grid)
	local index = 0
	local move = 0
	-- find first zero
	for i = 1, 4 do
		for j = 1, 4 do
			if grid[i][j] == 0 then
				index = j
				break
			end
			if j == 4 then 
				index = j
			end
		end
		if index~= 4 then			
			for k = 1, 4 do
				if grid[i][k] ~= 0 and k > index then
					move  = move + 1
					grid[i][index] = grid[i][k]
					grid[i][k] = 0
					index = index +1
				end
			end
		end
		
	end

	for i = 1, 4 do
		for j = 1, 3 do
			if grid[i][j] ~= 0 and grid[i][j] == grid[i][j+1] then
				move = move + 1
				grid[i][j] = grid[i][j] *2
				for n = j+1, 3 do
					grid[i][n] = grid[i][n+1]
				end
				grid[i][4] = 0
				break
			end
		end
	end
	return move
end
-- move right
local function moveRight(grid)
	local index = 0
	local move = 0
	-- find first zero
	for i = 1, 4 do
		for j = 4, 1, -1 do
			if grid[i][j] == 0 then
				index = j
				break
			 end
			 if j == 1 then 
				index = j
			end
		end
		if index~= 1 then
			for k = 4, 1, -1 do
				if grid[i][k] ~= 0 and k < index then
					move  = move + 1
					grid[i][index] = grid[i][k]
					grid[i][k] = 0
					index = index - 1
				end
			end
		end
	end

	for i = 1, 4 do
		for j = 4, 2, -1 do
			if grid[i][j] ~= 0 and grid[i][j] == grid[i][j-1] then
				move  = move + 1
				grid[i][j] = grid[i][j] * 2
				-- print(grid[i][j])
				for n = j-1,2 ,-1 do
					grid[i][n] = grid[i][n-1]
				end
				grid[i][1] = 0
				break
			end
		end
	end
	return move
	
end
-- move up
local function moveUp(grid)
	local index = 0
	local move = 0
	-- find first zero
	for i = 1, 4 do
		for j = 1, 4 do
			if grid[j][i] == 0 then
				index = j
				-- print(index)
				break
			 end
			if j == 4 then 
				index = j
			end
		end
		if index~= 4 then
			for k = 1, 4 do
				if grid[k][i] ~= 0 and k > index then
					move  = move + 1
					grid[index][i] = grid[k][i]
					grid[k][i] = 0
					index = index + 1
				end
			end
		end
	end

	for i = 1, 4 do
		for j = 1, 3 do
			if grid[j][i] ~= 0 and grid[j][i] == grid[j+1][i] then
				move  = move + 1
				grid[j][i] = grid[j][i] + grid[j+1][i]
				for n = j+1, 3 do
					grid[n][i] = grid[n+1][i]
				end
				grid[4][i] = 0
				break
			end
		end
	end
	return move
end
-- move down
local function moveDown(grid)
	local index = 0
	local move = 0
	-- find first zero
	for i = 1, 4 do
		for j = 4, 1, -1 do
			if grid[j][i] == 0 then
				index = j
				-- print(index)
				break
			end
			if j == 1 then 
				index = j
			end
		end
		if index~= 1 then
			for k = 4, 1, -1 do
				if grid[k][i] ~= 0 and k < index then
					move  = move + 1
					grid[index][i] = grid[k][i]
					grid[k][i] = 0
					index = index - 1
				end
			end
		end
	end

	for i = 1, 4 do
		for j = 4, 2, -1 do
			if grid[j][i] ~= 0 and grid[j][i] == grid[j-1][i] then
				move  = move + 1
				grid[j][i] = grid[j][i] + grid[j-1][i]
				for n = j-1, 2, -1 do
					grid[n][i] = grid[n-1][i]
				end
				grid[1][i] = 0
				break
			end
		end
	end
	return move
end
-- rule of the game
local function info()
	print("Enter command to move the number on the grid.")
	print("The two adjacent number and value are the same will be add after move.")
	print("If you get 2048 then you win, if the grid is full then game over.")
	print("The command which use to move the number:")
	print("left: move all number to the left")
	print("right: move all number to the right")
	print("up: move all number to the top of the grid")
	print("down: move all number to the bottom of the grid")
	print("exit: terminal the game")
	print("all command are lower case")
end
-- main function 
local function main()
	local grid = creatGrid()
	local m = 0
	local err = 0
	info()
	print("Start Game:")
	initGrid(grid)	
	createNum(grid)
	printGrid(grid)	
    local input = io.read()
    while input ~= "exit" do
	    if input== "up" then 
	     	m = moveUp(grid)
	     	if m == 0 then
		    	print("Can not move! Try again!")
		    else
		    	createNum(grid)
		    	printGrid(grid)
		    	local g = gameOver(grid)
		    	if g == 1 then 
		    		break
		    	end
		    	local w = getGoal(grid)
		    	if w == 1 then
		    		break
		    	end
		    end
	    elseif input == "down" then
	     	m = moveDown(grid)
	     	if m == 0 then
		    	print("Can not move! Try again!")
		    else
		    	createNum(grid)
		    	printGrid(grid)
		    	local g = gameOver(grid)
		    	if g == 1 then 
		    		break
		    	end
		    	local w = getGoal(grid)
		    	if w == 1 then
		    		break
		    	end
		    end
	    elseif input == "left" then
	    	m = moveLeft(grid)  
	    	if m == 0 then
		    	print("Can not move! Try again!")
		    else
		    	createNum(grid)
		    	printGrid(grid)
		    	local g = gameOver(grid)
		    	if g == 1 then 
		    		break
		    	end
		    	local w = getGoal(grid)
		    	if w == 1 then
		    		break
		    	end
		    end 	
	    elseif input == "right" then
	    	m = moveRight(grid)
	    	if m == 0 then
		    	print("Can not move! Try again!")
		    else
		    	createNum(grid)
		    	printGrid(grid)
		    	local g = gameOver(grid)
		    	if g == 1 then 
		    		break
		    	end
		    	local w = getGoal(grid)
		    	if w == 1 then
		    		break
		    	end
		    end
	    else
	    	print("Input error! Try again!")
	    end
	    
		    
		
	    input = io.read()
	end

end
main()
