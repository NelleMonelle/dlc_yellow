local actor, super = Class(Actor, "axisboss")

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
    self.default = "idle_body"

    self.voice = "axis"
    self.portrait_path = "face/axis"
    self.portrait_offset = {-26, -18}

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["idle_body"] = {"body", 1/6, true},
        ["hurt"] = {"hurt", 1/6, true},
        ["charge"] = {"charge", 1/12, false, next="charge_hold"},
        ["charge_hold"] = {"charge_hold", 1/12, true},
        ["charge_release"] = {"charge_release", 1/12, false, next="idle_body"},
    }

    self.offsets = {
        ["body"] = {0, 0},
        ["hurt"] = {0, 0},
    }
end

return actor