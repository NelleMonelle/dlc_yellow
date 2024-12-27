local SteamworksRoom34BG, super = Class(Event)

function SteamworksRoom34BG:init(x, y, width, height, properties)
	super.init(self, x, y, width, height)
	local properties = properties or {}
    self:setPosition(0,0)
	self.background = Assets.getTexture("world/events/steamworks/34_background")
	self.liquidfalls = Assets.getFrames("world/events/steamworks/34_liquidfalls")
	self.fill = Assets.getTexture("bubbles/fill")
	self.room_width = (Game.world.map.width * Game.world.map.tile_width)
	self.room_height = (Game.world.map.height * Game.world.map.tile_height)
	self.falls_frame = {0, 2, 5}
	self.falls_x = {1600, 2400, 3000}
	self.siner = 0
	self.frame = 0
	self.gradient_shader = Assets.newShader("alphagradientv")
end

function SteamworksRoom34BG:update()
	super.update(self)
	self.siner = (math.sin(Kristal.getTime()) * 10) - 3
	self.frame = self.frame + 0.5 * DTMULT
end

function SteamworksRoom34BG:draw()
	super.draw(self)
	local x, y = Game.world.camera:getPosition()
	Draw.draw(self.background, (x+70)/1.75, 0, 0, 2, 2)
	local shader = Kristal.Shaders["GradientV"]

	local last_shader = love.graphics.getShader()

	love.graphics.setShader(self.gradient_shader)
	self.gradient_shader:send("scale", 1)
	self.gradient_shader:sendColor("from", {237/255, 0, 143/255, 0})
	self.gradient_shader:sendColor("to", {1, 1, 0, 0.7})
	local ry = (self.room_height/1.05) + self.siner
	-- I have to cheat in a "rectangle" here lol
	Draw.draw(self.fill, 0, ry, 0, self.room_width, SCREEN_HEIGHT-ry)
	love.graphics.setShader(shader)
	shader:sendColor("from", {237/255, 0, 143/255, 1})
	shader:sendColor("to", COLORS.yellow)
	for i = 1, 3 do
		local frame = (math.floor(self.frame)+self.falls_frame[i]) % #self.liquidfalls
		local fx = (x+self.falls_x[i]-320)
		Draw.draw(self.liquidfalls[frame+1], fx/2, 0, 0, 1, 10)
	end
	love.graphics.setShader(last_shader)
end

return SteamworksRoom34BG