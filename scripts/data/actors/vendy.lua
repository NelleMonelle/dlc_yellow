local actor, super = Class(Actor, "vendy")

function actor:init()
    super.init(self)

    self.name = "Vendy"

    self.width = 136
    self.height = 107

    self.hitbox = nil

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "shopkeepers/vendy"
    self.default = "face_boot_1"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.talk_sprites = {
        ["face_angry"] = 0.15,
        ["face_base"] = 0.15,
        ["face_boot_1"] = 0.15,
        ["face_boot_2"] = 0.15,
        ["face_boot_3"] = 0.15,
        ["face_happy"]  = 0.15,
        ["face_smug"]   = 0.15,
        ["face_sweaty"] = 0.15,
        ["face_uhh"]    = 0.15
    }

    self.animations = {}

    self.offsets = {
        ["body"]        = {0, 0},
        ["face_angry"]  = {0, 0},
        ["face_base"]   = {0, 0},
        ["face_boot_1"] = {0, 0},
        ["face_boot_2"] = {0, 0},
        ["face_boot_3"] = {0, 0},
        ["face_happy"]  = {0, 0},
        ["face_smug"]   = {0, 0},
        ["face_sweaty"] = {0, 0},
        ["face_uhh"]    = {0, 0},
    }
end

function actor:onSpriteDraw(sprite)
    super.onSpriteDraw(sprite)

    Draw.draw(Assets.getTexture("shopkeepers/vendy/body"), 0, 0, 0, 1, 1)
end

return actor
