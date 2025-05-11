local MailStation, super = Class(Event)

function MailStation:init(data)
    super.init(self, data)

    self.solid = true
    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/dunes/wild_east_bell")
    self.collider = Hitbox(self, 0, 94, 132, 68)
    self.ringing = false
end

function MailStation:onInteract(chara, dir)
    if not self.ringing then
        self.ringing = true
        Assets.playSound("wild_east_bell")
        self.sprite:play(1/10)
        Game.world.timer:after(1.8, function()
            self.ringing = false
            self:setSprite("world/events/dunes/wild_east_bell")
        end)
    end
    return true
end

return MailStation