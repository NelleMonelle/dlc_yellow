local actor, super = Class(Actor, "flowey_b")

function actor:init()
    super.init(self)

    self.name = "Flowey"

    self.width = 42
    self.height = 44

    self.hitbox = {0, 25, 19, 14}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "world/npcs/flowey/battle"
    self.default = "nice"

    self.voice = "flowey"
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["evil"] = 0.15,
        ["grin"] = 0.15,
        ["nice"] = 0.15,
        ["niceside"] = 0.15,
        ["pissed"] = 0.15,
        ["plain"] = 0.15,
        ["plainside"] = 0.15,
        ["sad"] = 0.15,
        ["smirk"] = 0.15,
        ["worried"] = 0.15,
        ["worriedside"] = 0.15
    }

    self.animations = {
        ["riseanim"] = {"riseanim", 1/10, false, next = "nice"},
        ["riseanim2"] = {"riseanim2", 1/10, false, next = "plain"},
        ["sinkanim"] = {"sinkanim", 1/10, false},
    }

    self.offsets = {
        ["riseanim"] = {0.5, -1},
        ["riseanim2"] = {0.5, -1},
        ["sinkanim"] = {0.5, -1},
    }
end

return actor