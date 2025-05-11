local Cake, super = Class(Event)

function Cake:init(data)
    super.init(self, data)

    self:setOrigin(0.5, 1)
    if Game:getFlag("chem_got_cake") then
        self:setSprite("world/events/steamworks/chem_03_cake_2")
    else
        self:setSprite("world/events/steamworks/chem_03_cake_1")
    end

    Game.world.timer:after(1/30, function ()
        self.layer = 0.5
    end)
end

return Cake