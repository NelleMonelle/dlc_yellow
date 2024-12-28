local actor, super = Class(Actor, "steamworks_hermit")

function actor:init()
    super.init(self)

    self.name = "Hermit"

    self.width = 43
    self.height = 58

    self.hitbox = {0, 46, 31, 8}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "world/npcs/steamworks"
    self.default = "hermit"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {}

    self.talk_sprites = {}

    self.offsets = {}

	self.staff_timer = 0
end

function actor:onSpriteDraw(sprite)
    super.onSpriteDraw(sprite)
	local staff_spr = Assets.getFrames("world/npcs/steamworks/hermit_staff")
	self.staff_timer = self.staff_timer + DTMULT
    Draw.draw(staff_spr[(math.floor(self.staff_timer/3)%30)+1], -32, -26, 0, 1, 1)
end

return actor