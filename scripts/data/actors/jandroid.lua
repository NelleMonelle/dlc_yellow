local actor, super = Class(Actor, "jandroid")

function actor:init()
    super.init(self)

    self.name = "Jandroid"

    self.width = 40
    self.height = 41

    self.hitbox = {0, 26, 40, 18}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "world/npcs/steamworks"
    self.default = "jandroid_1"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["jandroid"] = 0.2,
    }

    self.animations = {}

    self.offsets = {}

end

return actor