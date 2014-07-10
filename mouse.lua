mouseX = 0
mouseY = 0
mousedown = false

function mouseUpdate()
  mouseX = love.mouse.getX() + math.floor(oldcamX)
  mouseY = love.mouse.getY() + math.floor(oldcamY)
  
  --doesnt draw properly, think its because it draws once and then never again, must overlay somehow
  if love.mouse.isDown("l") then
	love.graphics.setCanvas(treecanvas)
	love.graphics.draw(coniferTall, mouseX, mouseY)
	mousedown = not mousedown
	love.graphics.setCanvas()
	update = true
end
end
