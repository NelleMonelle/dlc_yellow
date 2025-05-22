local MailStation, super = Class(Event)

function MailStation:init(data)
    super.init(self, data)

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/steamworks/35_gate")
    self.sprite.alpha = 0

    Game.world.timer:after(1/30, function()
        self.layer = 0.3
    end)
end

return MailStation