local SteamworksChemDoor, super = Class(Event)

function SteamworksChemDoor:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    if Game:getFlag("31_chem_door_opened") then
        self:setSprite("world/maps/steamworks/small_objects/31_door_5")
    else
        self:setSprite("world/maps/steamworks/small_objects/31_door_1")
    end
    self:setOrigin(0.5, 1)

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

return SteamworksChemDoor