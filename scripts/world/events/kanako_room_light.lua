local Cake, super = Class(Event)

function Cake:init(data)
    super.init(self, data)

    self:setOrigin(0, 0)
    self:setSprite("world/events/dunes/kanako_room_light")
    self.sprite.alpha = 0.5

    Game.world.timer:after(1/30, function ()
        self.layer = 0.5
    end)
end

return Cake