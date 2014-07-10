gridSize = 10
gridZ = 1
graphics_Update = true
z_updated = false
underground_Changed = false

function gridLoad()
	blockWidth = hillSW:getWidth()
	blockHeight = hillSW:getHeight()
	blockFace = blockHeight / 3.2
	treeWidth = coniferTall:getWidth()
	treeHeight = coniferTall:getHeight()
	treeFace = treeHeight / 2
   
	grid = {}
	for x = 1,gridSize do
		grid[x] = {}
		for y = 1,gridSize do
			grid[x][y] = 1
		end
	end

	--sets starting point somewhere in the middle of the screen, so the grid draws from there
	grid_x = 350
	grid_y = 100
end

function gridResize()
	for x = 1,gridSize do
		grid[x] = {}
		for y = 1,gridSize do
			grid[x][y] = 1
		end
	end
end

--generates a random number for each tile in the grid, this is used to populate the tile type
function gridGenerate()
	for x=1,gridSize do
		for y=1,gridSize do
			grid[x][y] = love.math.random(1,97)
		end
	end
end

function preGrid()
  grid = {{41, 44, 44, 44, 44, 44, 44, 44, 44, 43},
          {35, 35, 35, 35, 35, 35, 35, 35, 35, 35},
          {54, 57, 57, 57, 57, 57, 57, 57, 57, 57},
          {35, 35, 35, 35, 35, 35, 35, 35, 35, 35},
          {35, 35, 35, 35, 35, 35, 35, 35, 35, 35},
          {35, 35, 35, 35, 35, 35, 35, 35, 35, 35},
          {35, 35, 35, 35, 35, 35, 35, 35, 35, 35},
          {35, 35, 35, 35, 35, 35, 35, 35, 35, 35},
          {35, 35, 35, 35, 35, 35, 35, 35, 35, 35},
          {35, 35, 35, 35, 35, 35, 35, 35, 35, 35}}
end

function gridDraw()
	---
	love.graphics.setCanvas(xycanvas)
	xycanvas:clear()
	---
	for x = 1,gridSize do
		for y = 1,gridSize do
			local tempx = grid_x + ((y-x) * (blockWidth / 2))
			local tempy = grid_y + ((x+y) * (blockFace)) - (blockFace * (gridSize / 2)) - blockFace
			local treex = grid_x + ((y-x) * (treeWidth / 2))
			local treey = grid_y + ((x+y) * (treeFace)) - (treeFace * (gridSize / 2)) - treeFace
				--this is an inefficient tile type checker
				if grid[x][y] == 1 then love.graphics.draw(dirtDouble, tempx, tempy)
			elseif grid[x][y] == 2 then love.graphics.draw(beach, tempx, tempy)
			elseif grid[x][y] == 3 then love.graphics.draw(beachCornerNE, tempx, tempy)
			elseif grid[x][y] == 4 then love.graphics.draw(beachCornerNW, tempx, tempy)
			elseif grid[x][y] == 5 then love.graphics.draw(beachCornerSW, tempx, tempy)
			elseif grid[x][y] == 6 then love.graphics.draw(beachE, tempx, tempy)
			elseif grid[x][y] == 7 then love.graphics.draw(beachES, tempx, tempy)
			elseif grid[x][y] == 8 then love.graphics.draw(beachN, tempx, tempy)
			elseif grid[x][y] == 9 then love.graphics.draw(beachNE, tempx, tempy)
			elseif grid[x][y] == 10 then love.graphics.draw(beachNW, tempx, tempy)
			elseif grid[x][y] == 11 then love.graphics.draw(beachS, tempx, tempy)
			elseif grid[x][y] == 12 then love.graphics.draw(beachSW, tempx, tempy)
			elseif grid[x][y] == 13 then love.graphics.draw(beachW, tempx, tempy)
			elseif grid[x][y] == 14 then love.graphics.draw(bridgeEW, tempx, tempy)
			elseif grid[x][y] == 15 then love.graphics.draw(bridgeNS, tempx, tempy)
			--[[
			elseif grid[x][y] == 16 then love.graphics.draw(coniferAltShort, treex, treey)
			elseif grid[x][y] == 17 then love.graphics.draw(coniferAltTall, treex, treey)
			elseif grid[x][y] == 18 then love.graphics.draw(coniferShort, treex, treey)
			elseif grid[x][y] == 19 then love.graphics.draw(coniferTall, treex, treey)
			]]--
			elseif grid[x][y] == 20 then love.graphics.draw(crossroad, tempx, tempy)
			elseif grid[x][y] == 21 then love.graphics.draw(crossroadESW, tempx, tempy)
			elseif grid[x][y] == 22 then love.graphics.draw(crossroadNES, tempx, tempy)
			elseif grid[x][y] == 23 then love.graphics.draw(crossroadNEW, tempx, tempy)
			elseif grid[x][y] == 24 then love.graphics.draw(crossroadNSW, tempx, tempy)
			elseif grid[x][y] == 25 then love.graphics.draw(dirt, tempx, tempy)
			elseif grid[x][y] == 26 then love.graphics.draw(dirtDouble, tempx, tempy)
			elseif grid[x][y] == 27 then love.graphics.draw(endE, tempx, tempy)
			elseif grid[x][y] == 28 then love.graphics.draw(endN, tempx, tempy)
			elseif grid[x][y] == 29 then love.graphics.draw(endS, tempx, tempy)
			elseif grid[x][y] == 30 then love.graphics.draw(endW, tempx, tempy)
			elseif grid[x][y] == 31 then love.graphics.draw(exitE, tempx, tempy)
			elseif grid[x][y] == 32 then love.graphics.draw(exitN, tempx, tempy)
			elseif grid[x][y] == 33 then love.graphics.draw(exitS, tempx, tempy)
			elseif grid[x][y] == 34 then love.graphics.draw(exitW, tempx, tempy)
			elseif grid[x][y] == 35 then love.graphics.draw(grass, tempx, tempy)
			elseif grid[x][y] == 36 then love.graphics.draw(grassWhole, tempx, tempy)
			elseif grid[x][y] == 37 then love.graphics.draw(hillE, tempx, tempy)
			elseif grid[x][y] == 38 then love.graphics.draw(hillES, tempx, tempy)
			elseif grid[x][y] == 39 then love.graphics.draw(hillN, tempx, tempy)
			elseif grid[x][y] == 40 then love.graphics.draw(hillNE, tempx, tempy)
			elseif grid[x][y] == 41 then love.graphics.draw(hillNW, tempx, tempy)
			elseif grid[x][y] == 42 then love.graphics.draw(hillS, tempx, tempy)
			elseif grid[x][y] == 43 then love.graphics.draw(hillSW, tempx, tempy)
			elseif grid[x][y] == 44 then love.graphics.draw(hillW, tempx, tempy)
			elseif grid[x][y] == 46 then love.graphics.draw(lotE, tempx, tempy)
			elseif grid[x][y] == 47 then love.graphics.draw(lotES, tempx, tempy)
			elseif grid[x][y] == 48 then love.graphics.draw(lotN, tempx, tempy)
			elseif grid[x][y] == 49 then love.graphics.draw(lotNE, tempx, tempy)
			elseif grid[x][y] == 50 then love.graphics.draw(lotNW, tempx, tempy)
			elseif grid[x][y] == 51 then love.graphics.draw(lotS, tempx, tempy)
			elseif grid[x][y] == 52 then love.graphics.draw(lotSW, tempx, tempy)
			elseif grid[x][y] == 53 then love.graphics.draw(lotW, tempx, tempy)
			elseif grid[x][y] == 54 then love.graphics.draw(riverBankedES, tempx, tempy)
			elseif grid[x][y] == 55 then love.graphics.draw(riverBankedEW, tempx, tempy)
			elseif grid[x][y] == 56 then love.graphics.draw(riverBankedNE, tempx, tempy)
			elseif grid[x][y] == 57 then love.graphics.draw(riverBankedNS, tempx, tempy)
			elseif grid[x][y] == 58 then love.graphics.draw(riverBankedNW, tempx, tempy)
			elseif grid[x][y] == 59 then love.graphics.draw(riverBankedSW, tempx, tempy)
			elseif grid[x][y] == 60 then love.graphics.draw(riverES, tempx, tempy)
			elseif grid[x][y] == 61 then love.graphics.draw(riverEW, tempx, tempy)
			elseif grid[x][y] == 62 then love.graphics.draw(riverNE, tempx, tempy)
			elseif grid[x][y] == 63 then love.graphics.draw(riverNS, tempx, tempy)
			elseif grid[x][y] == 64 then love.graphics.draw(riverNW, tempx, tempy)
			elseif grid[x][y] == 65 then love.graphics.draw(riverSW, tempx, tempy)
			elseif grid[x][y] == 66 then love.graphics.draw(road, tempx, tempy)
			elseif grid[x][y] == 67 then love.graphics.draw(roadES, tempx, tempy)
			elseif grid[x][y] == 68 then love.graphics.draw(roadEW, tempx, tempy)
			elseif grid[x][y] == 69 then love.graphics.draw(roadHill2E, tempx, tempy)
			elseif grid[x][y] == 70 then love.graphics.draw(roadHill2N, tempx, tempy)
			elseif grid[x][y] == 71 then love.graphics.draw(roadHill2S, tempx, tempy)
			elseif grid[x][y] == 72 then love.graphics.draw(roadHill2W, tempx, tempy)
			elseif grid[x][y] == 73 then love.graphics.draw(roadHillE, tempx, tempy)
			elseif grid[x][y] == 74 then love.graphics.draw(roadHillN, tempx, tempy)
			elseif grid[x][y] == 75 then love.graphics.draw(roadHillS, tempx, tempy)
			elseif grid[x][y] == 76 then love.graphics.draw(roadHillW, tempx, tempy)
			elseif grid[x][y] == 77 then love.graphics.draw(roadNE, tempx, tempy)
			elseif grid[x][y] == 78 then love.graphics.draw(roadNS, tempx, tempy)
			elseif grid[x][y] == 79 then love.graphics.draw(roadNW, tempx, tempy)
			elseif grid[x][y] == 80 then love.graphics.draw(roadSW, tempx, tempy)
			--[[
			elseif grid[x][y] == 81 then love.graphics.draw(treeAltShort, treex, treey)
			elseif grid[x][y] == 82 then love.graphics.draw(treeAltTall, treex, treey)
			elseif grid[x][y] == 83 then love.graphics.draw(treeShort, treex, treey)
			elseif grid[x][y] == 84 then love.graphics.draw(treeTall, treex, treey)
			]]--
			elseif grid[x][y] == 85 then love.graphics.draw(water, tempx, tempy)
			elseif grid[x][y] == 86 then love.graphics.draw(waterCornerES, tempx, tempy)
			elseif grid[x][y] == 87 then love.graphics.draw(waterCornerNE, tempx, tempy)
			elseif grid[x][y] == 88 then love.graphics.draw(waterCornerNW, tempx, tempy)
			elseif grid[x][y] == 89 then love.graphics.draw(waterCornerSW, tempx, tempy)
			elseif grid[x][y] == 90 then love.graphics.draw(waterE, tempx, tempy)
			elseif grid[x][y] == 91 then love.graphics.draw(waterES, tempx, tempy)
			elseif grid[x][y] == 92 then love.graphics.draw(waterN, tempx, tempy)
			elseif grid[x][y] == 93 then love.graphics.draw(waterNE, tempx, tempy)
			elseif grid[x][y] == 94 then love.graphics.draw(waterNW, tempx, tempy)
			elseif grid[x][y] == 95 then love.graphics.draw(waterS, tempx, tempy)
			elseif grid[x][y] == 96 then love.graphics.draw(waterSW, tempx, tempy)
			elseif grid[x][y] == 97 then love.graphics.draw(waterW, tempx, tempy)
			
			elseif grid[x][y] == 98 then love.graphics.draw(undergroundDirt, tempx, tempy)
			
			else love.graphics.draw(grass, tempx, tempy)
			end
		end
	end
	---
	love.graphics.setCanvas()
	---
end

--this is a method to draw the underground
function zDraw()
	if underground_Changed == true then
---
	love.graphics.setCanvas(zcanvas)
	zcanvas:clear()
---
	for z = 1,gridZ do
		for x = 1,gridSize do
			for y = 1,gridSize do
				local tempx = grid_x + ((y-x) * (blockWidth / 2))
				local tempy = grid_y + ((x+y) * (blockFace)) - (blockFace * (gridSize / 2)) + (gridZ - z)*blockFace
				love.graphics.draw(dirtDouble, tempx, tempy)
			end
		end
	end
---
	love.graphics.setCanvas()
---
	else 
		zcanvas:clear()
		return
	end
end

function gridUpdate(dt)
	if love.keyboard.isDown("f4") then
		graphics_Update = not graphics_Update
		print("Graphics update toggled = ", graphics_Update)
		love.timer.sleep(0.1)
	end

	if graphics_Update then
		if love.keyboard.isDown("p") then
	  		gridSize = gridSize + 1
	  		print("Increasing grid size")
			print("Grid size: ", gridSize)
	  		love.timer.sleep(0.1)
	  		--gridGenerate()
	  		gridResize()
	  	end
	  	
	  	if love.keyboard.isDown("l") then
	  		gridSize = gridSize - 1
	  		print("Decreasing grid size")
	  		love.timer.sleep(0.1)
	  		--gridGenerate()
	  		gridResize()
	  	end
	  	
	  	if love.keyboard.isDown("o") then
	  		gridZ = gridZ + 1
	  		print("Increasing Z")
	  		z_updated = true
	  		love.timer.sleep(0.1)
	  		--gridGenerate()
	  	end
	end
	
	if love.keyboard.isDown("u") then
		underground_Changed = not underground_Changed
		print("Underground toggled", underground_Changed)
		love.timer.sleep(0.1)
	end
	
end
