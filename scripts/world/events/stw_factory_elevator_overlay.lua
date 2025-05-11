local Elevator, super = Class(Event)

function Elevator:init(data)
    super.init(self, data)

    self:setOrigin(0.5, 1)
    self:setSprite("world/events/steamworks/factory_elevator_overlay_1")

    Game.world.timer:after(1/30, function ()
        self.layer = 0.5
    end)
end

return Elevator