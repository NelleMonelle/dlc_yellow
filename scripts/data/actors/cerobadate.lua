local actor, super = Class(Actor, "cerobadate")

function actor:init()
    super.init(self)

    self.name = "Ceroba"

    self.width = 53
    self.height = 117

    self.hitbox = {0, 0, 16, 16}

    self.path = "battle/lightenemies/ceroba/date"
    self.default = "calm"

    self.voice = "ceroba"

    self.animations = {}

    self.offsets = {}

end

return actor