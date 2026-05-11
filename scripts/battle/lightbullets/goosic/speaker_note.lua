local SpeakerNote, super = Class(LightBullet)

function SpeakerNote:init(x, y, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/goosic/notes")

    self.physics.speed_y = speed or -12

    self.sprite:setAnimation({"battle/bullets/goosic/notes", 1/10, true})
    self:setScale(2, 2)
end

function SpeakerNote:update()

    super.update(self)
end

return SpeakerNote