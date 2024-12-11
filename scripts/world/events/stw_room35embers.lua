local SteamworksRoom35Embers, super = Class(Event)

function SteamworksRoom35Embers:init(x, y, width, height, properties)
	super.init(self, x, y, width, height)
	local properties = properties or {}
    self:setPosition(0,0)
	self.part_timer = 0
end

function SteamworksRoom35Embers:update()
	super.update(self)
	self.part_timer = self.part_timer + DTMULT
	if self.part_timer >= 1 then
		self.part_timer = 0
		local particle = SteamworksEmberParticle(Utils.random(1400-853.3143, 1400+853.3143),Utils.random(480-64,480+64))
		Game.world:addChild(particle)
	end
end

return SteamworksRoom35Embers