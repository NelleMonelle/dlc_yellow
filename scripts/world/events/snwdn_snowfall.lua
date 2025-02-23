local SnowdinSnowfall, super = Class(Event)

function SnowdinSnowfall:init(x, y, width, height, properties)
	super.init(self, x, y, width, height)
	local properties = properties or {}
    self:setPosition(0,0)
	self.part_timer = 0
	self.room_width = (Game.world.map.width * Game.world.map.tile_width)
	self.room_height = (Game.world.map.height * Game.world.map.tile_height)
	local part_dist = self.room_width / 8
	for i = 0, math.floor(part_dist) do
		local particle = SnowdinSnowflakeParticle(Utils.random(0, self.room_width),Utils.random(-400, self.room_height))
		Game.world:addChild(particle)
	end
end

function SnowdinSnowfall:update()
	super.update(self)
	self.part_timer = self.part_timer + DTMULT
	if self.part_timer >= 1 then
		self.part_timer = 0
		if love.math.random(8) == 1 then
			local particle = SnowdinSnowflakeParticle(Utils.random(0, self.room_width), Utils.random(0, Game.world.camera.y-SCREEN_HEIGHT/2))
			Game.world:addChild(particle)
		end
	end
end

return SnowdinSnowfall