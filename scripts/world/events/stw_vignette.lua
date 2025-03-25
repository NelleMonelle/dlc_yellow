local SteamworksVignette, super = Class(Event)

function SteamworksVignette:init(data)
	super.init(self, data.x, data.y, data.width, data.height)
    self:setPosition(0,0)
    self:setParallax(0,0)
    self:setSprite("world/maps/steamworks/vignette")
end

function SteamworksVignette:onAdd(parent)
    super.onAdd(self,parent)
    self:setLayer(WORLD_LAYERS["below_ui"])
end

return SteamworksVignette