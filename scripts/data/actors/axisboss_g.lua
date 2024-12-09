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

    self.path = "world/npcs/steamworks/axis"
    self.default = "idle_shield"

    self.voice = "axis"
    self.portrait_path = "face/axis"
    self.portrait_offset = {-26, -18}

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["idle_shield"] = {"lightbattle/geno_lid", 1/6, true},
        ["idle"] = {"lightbattle/body_geno", 1/6, true},
        ["hurt"] = {"lightbattle/geno_lid_block", 1/6, true},
    }

    self.offsets = {
        ["lightbattle/geno_lid"]  = {0, 0},
        ["lightbattle/geno_lid_block"]  = {0, 0},
    }
end

return actor