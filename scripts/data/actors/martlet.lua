local actor, super = Class(Actor, "martlet")

function actor:init()
    super.init(self)

    self.name = "Martlet"

    self.width = 27
    self.height = 49

    self.hitbox = {4, 42, 19, 13}

    self.color = {1, 1, 0}

    self.path = "world/npcs/martlet"
    self.default = "talk"

    self.voice = "martlet"
    self.portrait_path = "face/martlet"
    self.portrait_offset = {-17, -21}

    self.can_blush = false

    self.talk_sprites = {
        ["talk/down"] = 0.15,
        ["talk/up"] = 0.15,
        ["talk/left"] = 0.15,
        ["talk/right"] = 0.15
    }

    self.animations = {
        ["fly_away"] = {"fly_away", 1/15, false},
    }

    self.offsets = {
        -- Movement offsets
        ["talk/down"] = {0, 0},
        ["talk/right"] = {0, 0},
        ["talk/left"] = {0, 0},
        ["talk/up"] = {0, 0},

        ["walk/down"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/up"] = {0, 0},

        -- Cutscene offsets
        ["fly_away"] = {-18, -151},
    }
end

--[[function actor:onWorldDraw(chara) -- bruh doesn't work gotta make workarounds or smt
    if self.moving_x ~= 0 or self.moving_y ~= 0 and self.default == "talk" then
       self.default = "walk"
       chara:resetSprite()
    elseif self.moving_x == 0 and self.moving_y == 0 and self.default == "walk" then
       self.default = "talk"
       chara:resetSprite()
    end
end]]

return actor