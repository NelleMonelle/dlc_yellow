local Elevator, super = Class(Event)

function Elevator:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/maps/steamworks/04_generator_pink", 1/15)

    --[[Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)]]
end

return Elevator