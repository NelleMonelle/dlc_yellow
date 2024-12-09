local SteamworksLightbeamBottom, super = Class(Event)

function SteamworksLightbeamBottom:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setSprite("world/maps/steamworks/small_objects/20_lightbeam_big_bottom")
    self:setOrigin(1, 0)
    self.sprite.color = {250/255, 131/255, 168/255}

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

return SteamworksLightbeamBottom