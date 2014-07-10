

function cameraLoad()
	camx = 0
	camy = 0
	oldcamY = 0
	oldcamX = 0
end

function cameraUpdate(dt)
	if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
		oldcamX = camx
		camx = camx - 400 * dt
		update = true
	end
	if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
		oldcamX = camx
		camx = camx + 400 * dt
		update = true
	end
	if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
		oldcamY = camy
		camy = camy - 200 * dt
		update = true
	end
	if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
		oldcamY = camy
		camy = camy + 200 * dt
		update = true
	end
end

function cameraMove()
	love.graphics.setCanvas(maincanvas)
	love.graphics.translate(math.floor(-camx),math.floor(-camy))
	--love.graphics.translate(-camx,-camy)
	love.graphics.setCanvas()
end

function guiDraw()
	love.graphics.setCanvas(guicanvas)
	guicanvas:clear()
	love.graphics.print("FPS: "..love.timer.getFPS(), oldcamX, oldcamY+0)
	love.graphics.print("OldX: "..math.floor(oldcamX), oldcamX, oldcamY+20)
	love.graphics.print("OldY: "..math.floor(oldcamY), oldcamX, oldcamY+30)
	love.graphics.print("X: "..mouseX, oldcamX, oldcamY+40)
	love.graphics.print("Y: "..mouseY, oldcamX, oldcamY+50)
	if mousedown == true then love.graphics.print("Click", oldcamX, oldcamY+60) mousedown = not mousedown end
	love.graphics.setCanvas()
end
