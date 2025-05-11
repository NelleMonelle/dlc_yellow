local SteamworksTrapdoor, super = Class(Event)

function SteamworksTrapdoor:init(data)
    super.init(self, data)

    self:setSprite("world/maps/steamworks/small_objects/12_trapdoor_1")
    self:setOrigin(0.5, 0.5)

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

return SteamworksTrapdoor