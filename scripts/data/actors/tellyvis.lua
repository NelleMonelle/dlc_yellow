local actor, super = Class(Actor, "tellyvis")

function actor:init()
    super.init(self)

    self.name = "Telly-Vis"

    self.width = 52
    self.height = 53

    self.hitbox = {0, 35, 52, 18}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "world/npcs/steamworks"
    self.default = "tellyvis_1"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["tellyvis"] = 0.2,
    }

    self.animations = {}

    self.offsets = {}

end

return actor