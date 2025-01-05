local actor, super = Class(Actor, "frostermit_b")

function actor:init()
    super.init(self)

    self.name = "Frostermit"

    self.light_battle_width = 59
    self.light_battle_height = 42

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
        ["lightbattle_hurt"] = {"body", 1/10, false},
        ["lightbattle_defeat"] = {"smashed", 1/10, false},
        ["lightbattle_spared"] = {"spared", 1/10, false},
    }

    self.offsets = {
        ["smashed"] = {0, 6},
        ["spared"] = {0, 0},
    }

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body")
            sprite:setOrigin(0, 0)
            --sprite.layer = 400
            return sprite
        end
    })

end

return actor