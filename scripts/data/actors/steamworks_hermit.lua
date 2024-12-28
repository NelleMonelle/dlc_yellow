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

end

function actor:onSpriteDraw(sprite)
    super.onSpriteDraw(sprite)

    --help how do I make it play
    Draw.draw(Assets.getTexture("world/npcs/steamworks/hermit_staff_1"), -32, -26, 0, 1, 1)--:play(1/10)
end

return actor