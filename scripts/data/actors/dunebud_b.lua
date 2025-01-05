local actor, super = Class(Actor, "dunebud_b")

function actor:init()
    super.init(self)

    self.name = "Dunebud"

    self.light_battle_width = 48
    self.light_battle_height = 47

    self.use_light_battler_sprite = true

    self.hitbox = {0, 26, 40, 18}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "battle/lightenemies/dunebud"
    self.default = ""

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["lightbattle_hurt"] = {"dead", 1/8, false},
        ["lightbattle_spared"] = {"spared", 1/8, false},
    }

    self.offsets = {
        ["dead"] = {-5, -5},
        ["spared"] = {0, 0},
    }

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/normal")
            sprite:setOrigin(0, 0)
            sprite:play(1/10)
            --sprite.layer = 400
            return sprite
        end
    })

end

return actor