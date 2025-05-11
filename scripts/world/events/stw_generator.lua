local SteamworksGenerator, super = Class(Event)

function SteamworksGenerator:init(data)
    super.init(self, data)

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/maps/steamworks/04_generator_pink_top", 1/15)

    self.btm_sprite  = self:addChild(Sprite("world/maps/steamworks/04_generator_pink"))
	self.btm_sprite:play(1/15, true)
	self.btm_sprite:setScale(2)
	self.btm_sprite.layer = 0.3
end


function SteamworksGenerator:update()
    super.update(self)
end

return SteamworksGenerator