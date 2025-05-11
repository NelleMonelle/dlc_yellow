local SteamworksChem05Door, super = Class(Event)

function SteamworksChem05Door:init(data)
    super.init(self, data)

	if Game:getFlag("chem_05_acid_used") then
		self:setSprite("world/maps/steamworks/small_objects/chem_05_door_23")
		self.solid = false
	else
		self:setSprite("world/maps/steamworks/small_objects/chem_05_door_1")
		self.solid = true
	end
    self:setOrigin(0.5, 0.5)
end

return SteamworksChem05Door