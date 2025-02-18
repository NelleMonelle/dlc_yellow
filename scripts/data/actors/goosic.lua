local actor, super = Class(Actor, "goosic")

function actor:init()
    super.init(self)

    self.name = "Goosic"

    self.width = 39
    self.height = 51

    self.hitbox = {20, 30, 18, 21}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "world/npcs/steamworks"
    self.default = "goosic_1"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["goosic"] = 0.2,
    }

    self.animations = {}

    self.offsets = {}

end

return actor