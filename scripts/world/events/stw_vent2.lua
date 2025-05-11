local SteamworksVent, super = Class(Event)

function SteamworksVent:init(data)
    super.init(self, data)

    self:setSprite("world/maps/steamworks/small_objects/14_vent")
    self:setOrigin(0.5, 1)

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

return SteamworksVent