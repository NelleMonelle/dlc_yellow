local MailStation, super = Class(Event)

function MailStation:init(data)
    super.init(self, data)

    self.solid = true
    self:setOrigin(0, 0)
    self:setSprite("world/events/dunes/mail_station")
end

function MailStation:onInteract(chara, dir)
    Game.world:startCutscene(function(cutscene)
        Assets.playSound("bell_ring_cow")
        self.sprite:play(1/12)
        cutscene:wait(1.33)
        self:setSprite("world/events/dunes/mail_station")
        cutscene:text("* But nobody came.")
    end)
    return true
end

return MailStation