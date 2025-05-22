local actor, super = Class(Actor, "starlo_b")

function actor:init()
    super.init(self)

    self.name = "Starlo"

    self.light_battle_width = 54
    self.light_battle_height = 107

    self.hitbox = {0, 0, 16, 16}

    self.use_light_battler_sprite = true

    self.path = "battle/lightenemies/starlo"
    self.default = ""

    self.voice = "starlo"

    self.animations = {
        ["lightbattle_hurt"] = {"body_hurt", 1, true},
        ["shoot"] = {"body_shoot", 1/10, true}
    }

    self.offsets = {
        ["body_hurt"] = {0, 0},
        ["body_dead"] = {4, 16}
    }

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body", 27, 107)
            sprite:setOrigin(0.5, 1)
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT

            part.sprite.scale_y = (30+(math.sin(part.timer /60)))/30
        end
    })
    
    self:addLightBattlerPart("head", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/head", 27, 32)
            sprite:setOrigin(0.5, 1)
            sprite.layer = 500
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT

            part.sprite.y = (-math.sin(part.timer/60) * 3) + 32
        end
    })

end

return actor