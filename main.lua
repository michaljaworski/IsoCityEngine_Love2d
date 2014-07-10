
require 'switch'
require 'camera'
require 'tiles'
require 'grid'
require 'mouse'

fullscreen = false
screenwidth = 1024
screenheight = 768
update = false

function love.load()
	assert(love.graphics.isSupported("canvas"), "Your graphics card does not support canvases, sorry!")
	---
	guicanvas = love.graphics.newCanvas(screenwidth, screenheight)
	maincanvas = love.graphics.newCanvas(screenwidth, screenheight)
	xycanvas = love.graphics.newCanvas(screenwidth, screenheight)
	zcanvas = love.graphics.newCanvas(screenwidth, screenheight)
	treecanvas = love.graphics.newCanvas(screenwidth, screenheight)
	---
	
	love.graphics.setBackgroundColor(0, 0, 0)
	--load misc
	cameraLoad()
	landtilesLoad()
	gridLoad()
end

function love.update(dt)
	mouseUpdate()
	cameraUpdate(dt)
	cameraMove()
	gridUpdate(dt)
	gridDraw()
	zDraw()
	---
	guiDraw()
	---
	
	if love.keyboard.isDown("escape") or love.keyboard.isDown("q") then
  		love.event.quit()
  	end
  
  	if graphics_Update then
	  	if love.keyboard.isDown("g") then
	  		gridGenerate()	--generate random map when button is pressed
	  		love.timer.sleep(0.1)
	  		print("New map generated.")
	  	end
      
      if love.keyboard.isDown("f5") then
        preGrid() --generate predesigned gird
        love.timer.sleep(0.1)
        print("Pre grid drawn.")
      end
      
      if love.keyboard.isDown("f2") then
        fullscreen = not fullscreen
        love.window.setFullscreen(fullscreen, "desktop")
      end
      
      if love.keyboard.isDown("f7") then
		love.graphics.scale(0.5, 0.5)
	  end
	  if love.keyboard.isDown("f8") then
		love.graphics.scale(1.5, 1.5)
	  end
      
	end
end

function love.draw()
	love.graphics.setCanvas(maincanvas)
	maincanvas:clear()
	love.graphics.draw(zcanvas)
	love.graphics.draw(xycanvas)
	love.graphics.draw(treecanvas)
	love.graphics.setCanvas()
	
	love.graphics.draw(maincanvas)
	love.graphics.draw(guicanvas)
end

