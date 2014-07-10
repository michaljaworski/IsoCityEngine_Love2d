
function love.conf(t)
	t.modules.joystick = true
	t.modules.audio = true
	t.modules.keyboard = true
	t.modules.event = true
	t.modules.image = true
	t.modules.timer = true
	t.modules.mouse = true
	t.modules.sound = true
	t.modules.thread = true
	t.modules.physics = true

	t.window.resizable = true

	-- debugging console for Windows only; turn this off on release
	t.console = true
	t.title = "IsoTest"
	t.author = "Me"

	-- fullscreen has to be off to use the dev console
	t.screen.fullscreen = false
	t.screen.vsync = false
	t.screen.fsaa = 0
	t.screen.height = 1024
	t.screen.width = 768
end
