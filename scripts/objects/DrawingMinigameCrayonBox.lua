local DrawingMinigameCrayonBox, super = Class(Object)

function DrawingMinigameCrayonBox:init()
    super.init(self,25,130,60,60)
    self.texture_inside = Assets.getFrames("id_minigame/crayon_box_inside")
    self.texture_outside = Assets.getFrames("id_minigame/crayon_box_outside")
    self.texture_crayons = Assets.getFrames("id_minigame/crayon")
    self.box_clock = 0
    self.crayons = {}
    local x,y = 28,15
    for i=1,8 do

        x, y = x + 8, y + 1.5
        local crayon = self:addChild(DrawingMinigameCrayon(i, x, y+30))
        crayon:slideTo(x,y, 0.5)
        table.insert(self.crayons, crayon)
    end
end

function DrawingMinigameCrayonBox:update()
    super.update(self)
    self.box_clock = self.box_clock + DT
end

function DrawingMinigameCrayonBox:draw()
    local frame = Utils.clamp(math.ceil(self.box_clock * 10), 0-3, 8-3)+4
    if frame >= 7 then Draw.setColor({0.4,0.4,0.4}) end
    love.graphics.push()
    -- love.graphics.translate(25, 130)
    self:drawBoxOutside(frame)
    Draw.setColor(COLORS.white)
    super.draw(self)
    self:drawBoxInside(frame)
    love.graphics.pop()
end
function DrawingMinigameCrayonBox:drawBoxOutside(frame)
    Draw.draw(self.texture_outside[frame])
end
function DrawingMinigameCrayonBox:drawBoxInside(frame)
    Draw.draw(self.texture_inside[frame])
end

function DrawingMinigameCrayonBox:drawCrayons()
    love.graphics.push()
    love.graphics.translate(28, Utils.clampMap(self.box_clock, 0.5, 1, 30, 0) + 15)
    for index, crayon in ipairs(self.texture_crayons) do
        love.graphics.translate(8, 1.5)
        Draw.draw(crayon)
    end
    love.graphics.pop()
end

return DrawingMinigameCrayonBox