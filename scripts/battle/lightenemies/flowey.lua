local Flowey, super = Class(LightEnemyBattler)

function Flowey:init()
    super:init(self)

    self.name = "Flowey"
    self:setActor("flowey_b")

    self.max_health = 50
    self.health = 50
    self.attack = 1
    self.defense = 0
    self.money = 0
    self.experience = 0

    self.animation_state = false

    self.dialogue_bubble = "ut_above"
    self.dialogue_offset = {-140, -110}

    self.waves = {}

    self.dialogue = {}

    self.check = "ATK "..self.attack.." DEF "..self.defense.."\n* Your best friend!"

    self.text = {
        "* Flowey."
    }

    --self.gauge_size = {250, 20}

    self.damage_offset = {0, 80}
end

function Flowey:onAct(battler, name)
    if name == "Standard" then
        return "* "
    end

    return super:onAct(self, battler, name)
end

function Flowey:update()
    super:update(self)
    if not self.animation_state then
        if self.bubble and self.bubble:isTyping() then
            if not self.sprite.playing then
                self.sprite:play(4/30, true)
            end
        elseif self.sprite.playing then
            self.sprite:stop()
        end
    end
end

return Flowey