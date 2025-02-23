local SnowdinRipples, super = Class(Event)

function SnowdinRipples:init(x, y, w, h)
    super.init(self, x, y, w, h)

    self:setSprite("world/events/snowdin/water_ripples", 0.2)
	self.room_width = (Game.world.map.width * Game.world.map.tile_width)
end

function SnowdinRipples:update()
    super.update(self)
	self.x = self.x + DTMULT
	if self.x > self.room_width-6 then
		self.x = -28
	end
end

return SnowdinRipples