local DrawingMinigame, super = Class(Object)

function DrawingMinigame:init(sprite)
    local base_texture = Assets.getTexture(sprite)
    super.init(self,0,0, base_texture:getWidth(), base_texture:getHeight())
    self.canvas = love.graphics.newCanvas(self:getSize())
    Draw.pushCanvas(self.canvas)
    Draw.draw(base_texture)
    Draw.popCanvas()
    self:setScale(2)
    self:setParallax(0)
end

function DrawingMinigame:draw()
    Draw.draw(self.canvas)
    super.draw(self)
end

function DrawingMinigame:update()
    super.update(self)
    Draw.pushCanvas(self.canvas)
    if Input.mouseDown(1) then
        local x,y = Input.getMousePosition()
        love.graphics.rectangle("fill", ((x)/self.scale_x)+self.x, ((y+self.y)/self.scale_y), 8,8)
    end
    Draw.popCanvas()
    if Input.pressed("menu") then
        self.canvas:newImageData():encode("png", "saves/stworks_id_"..Game.save_id..".png")
        self.done = true
        self:remove()
    end
end

return DrawingMinigame