local actor, super = Class(Actor, "frostermit_b_revealed_hurt")

function actor:init()
    super.init(self)

    self.name = "Frostermit"

    self.light_battle_width = 70
    self.light_battle_height = 51

    self.use_light_battler_sprite = true

    self.hitbox = {0, 26, 40, 18}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "battle/lightenemies/frostermit"
    self.default = ""

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["lightbattle_hurt"] = {"dead", 1/10, false},
        ["lightbattle_spared"] = {"spared", 1/10, false},
    }

    self.offsets = {
        ["dead"] = {0, 0},
        ["spared"] = {0, 0},
    }

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body_critical_crab", 4, 0)
            sprite:setOrigin(0, 0)
            sprite.layer = 400
            return sprite
        end
    })

    self:addLightBattlerPart("head", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/head_critical", 5, 19)
            sprite:setOrigin(0, 0)
            sprite.layer = 410
            return sprite
        end
    })

    self:addLightBattlerPart("claw_left", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/claw_left", 2, 22)
            sprite:setOrigin(0, 0)
            sprite.layer = 390
            return sprite
        end
    })

    self:addLightBattlerPart("claw_right", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/claw_right_critical", 35, 23)
            sprite:setOrigin(0, 0)
            sprite.layer = 430
            return sprite
        end
    })

    self:addLightBattlerPart("leg_right_2", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/leg_right_2", 46, 21)
            sprite:setOrigin(0, 0)
            sprite.layer = 420
            return sprite
        end
    })

    self:addLightBattlerPart("leg_right_3", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/leg_right_3_critical", 53, 18)
            sprite:setOrigin(0, 0)
            sprite.layer = 410
            return sprite
        end
    })

end

return actor