local SteamworksFurnaceOverlay, super = Class(Event)

function SteamworksFurnaceOverlay:init(data)
	super.init(self, data)
    self:setSprite("world/maps/steamworks/35_overlay", 1 / 5)
end

return SteamworksFurnaceOverlay