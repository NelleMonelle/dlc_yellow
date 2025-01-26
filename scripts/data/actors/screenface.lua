local actor, super = Class(Actor, "screenface")

function actor:init()
    super.init(self)

    self.name = "Screenface"

    self.width = 25
    self.height = 42

    self.hitbox = {0, 0, 25, 42}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "world/npcs/steamworks/screenface"
    self.default = "blank"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {
        ["talking"] = 0.15
    }

    self.animations = {
        ["down"] = {"down", 1/7, true},
        ["hello"] = {"hello", 1/7, false},
        ["loading"] = {"loading", 1/7, true},
        ["up"] = {"up", 1/7, true},
    }

    self.offsets = {}
end

function actor:onTalkStart(text, sprite)
    sprite:setSprite("talking")
end

--function actor:onTalkEnd(text, sprite) end

return actor