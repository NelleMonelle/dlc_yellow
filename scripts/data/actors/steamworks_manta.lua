local actor, super = Class(Actor, "steamworks_manta")

function actor:init()
    super.init(self)

    self.name = "Manta"

    self.width = 87
    self.height = 87

    self.hitbox = {0, 0, 87, 87}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "world/npcs/steamworks/manta"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.animations = {
        ["idle/left"]               = {"idle/left", 4/30, true},
        ["idle/right"]              = {"idle/right", 4/30, true},
        ["idle/up"]                 = {"idle/up", 4/30, true},
        ["idle/down"]               = {"idle/down", 4/30, true},
        ["move/left"]               = {"moving/left", 4/30, true},
        ["move/right"]              = {"moving/right", 4/30, true},
        ["move/up"]                 = {"moving/up", 4/30, true},
        ["move/down"]               = {"moving/down", 4/30, true},
	}
	
	self.offsets = {}
end

return actor