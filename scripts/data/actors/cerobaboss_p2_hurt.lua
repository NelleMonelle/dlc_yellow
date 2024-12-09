local actor, super = Class(Actor, "cerobaboss_p2_hurt")

function actor:init()
    super.init(self)

    self.name = "Ceroba"

    self.light_battle_width = 113
    self.light_battle_height = 114

    self.hitbox = {0, 0, 16, 16}

    self.use_light_battler_sprite = true

    self.path = "battle/lightenemies/ceroba"
    self.default = "idle"

    self.voice = "ceroba"

    self.animations = {
        ["lightbattle_hurt"] = {"hurt_phase_2", 1, true},
        ["intro"] = {"animations/intro", 1/11, false},
        ["phase_switch"] = {"animations/phase_switch", 1/11, false},
        ["staff_spin"] = {"animations/staff_spin", 1/11, false},
        ["death"] = {"animations/death", 1/6, false},
    }

    self.offsets = {
        ["hurt_phase_2"] = {-9, 5},
        ["animations/intro"] = {-21, -20},
        ["animations/phase_switch"] = {-23, -28},
        ["animations/staff_spin"] = {-23, -28},
        ["animations/death"] = {-9, 5},
        ["dead"] = {-5, 5},
    }

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body_hurt", 55, 112)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 480
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT

            part.sprite.scale_y = (30+(math.sin(part.timer /20)))/30
        end
    })
    
    self:addLightBattlerPart("head", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/head_hurt", 57.5, 55)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 500
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT

            part.sprite.y = (-math.sin(part.timer/20) * 3) + 55
        end
    })

    self:addLightBattlerPart("ponytail", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/ponytail_hurt", 44.5, 64)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 460
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT

            part.sprite.y = (-math.sin(part.timer/20) * 3) + 64
        end
    })

    self:addLightBattlerPart("hand_right", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/hand_right_hurt", 71.5, 79)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 490
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT

            part.sprite.y = (-math.sin(part.timer/20) * 3) + 79
        end
    })

    self:addLightBattlerPart("hand_left", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/hand_left_hurt", 33.5, 78)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 470
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT

            part.sprite.y = (-math.sin(part.timer/20) * 3) + 78
        end
    })

    self:addLightBattlerPart("staff", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/staff_red_hurt", 48, 109)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 450
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT

            part.sprite.y = (-math.sin(part.timer/20) * 3) + 109
        end
    })

end

return actor