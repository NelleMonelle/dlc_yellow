local SteamworksLightbeam, super = Class(Event)

function SteamworksLightbeam:init(data)
    super.init(self, data)

    self:setSprite("world/maps/steamworks/small_objects/20_lightbeam_big")
    self:setOrigin(1, 1)
    self.sprite.color = {250/255, 131/255, 168/255}

    Game.world.timer:after(1/30, function ()
        self.layer = 0.5
    end)
end

return SteamworksLightbeam