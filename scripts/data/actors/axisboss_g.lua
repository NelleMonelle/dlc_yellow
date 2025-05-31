local actor, super = Class(Actor, "axisboss_g")

function actor:init()
    super.init(self)

    self.name = "Axis"

    self.width = 109
    self.height = 118

    self.use_light_battler_sprite = false

    self.hitbox = {0, 25, 19, 14}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "battle/lightenemies/axis"
    self.default = "idle_shield"

    self.voice = "axis"

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["idle_shield"] = {"geno_lid", 1/6, true},
        ["idle"] = {"body_geno", 1/6, true},
        ["hurt"] = {"geno_lid_block", 1/6, true},
    }

    self.offsets = {
        ["geno_lid"]  = {0, 0},
        ["geno_lid_block"]  = {0, 0},
    }
end

return actor