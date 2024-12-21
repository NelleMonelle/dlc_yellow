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
    self:setOrigin(.5,0)
    self:setPosition(SCREEN_WIDTH/2, 30)
    self.cursor = self:addChild(Sprite("id_minigame/crayon_cursor"))
    self.cursor:setOrigin(0,0)
end

function DrawingMinigame:draw()
    Draw.draw(self.canvas)
    super.draw(self)
end

function DrawingMinigame:update()
    local prev_cur_x, prev_cur_y = self.cursor.x, self.cursor.y
    if Input.usingGamepad() then
        if Utils.dist(0,0,Input.gamepad_left_x, Input.gamepad_left_y) > 0.2 then
            self.cursor:move(Input.gamepad_left_x, Input.gamepad_left_y, DT * 150)
        end
    else
        self.cursor:setScreenPos(Input.getMousePosition())
    end
    super.update(self)
    Draw.pushCanvas(self.canvas)
    if Input.mouseDown(1) then
        local x,y = Input.getMousePosition()
        love.graphics.setLineWidth(8)
        love.graphics.setLineJoin("miter")
        for i=0, 1, 1/math.floor(Utils.dist(self.cursor.x, self.cursor.y,prev_cur_x,prev_cur_y)+1) do
            --(self.cursor.x, self.cursor.y,prev_cur_x,prev_cur_y
            local x = Utils.lerp(self.cursor.x, prev_cur_x, i)
            local y = Utils.lerp(self.cursor.y, prev_cur_y, i)
            love.graphics.rectangle("fill", x-4, y-4, 8, 8)
        end
    end
    Draw.popCanvas()
    if Input.pressed("menu") and not Input.ctrl() then
        self.canvas:newImageData():encode("png", "saves/stworks_id_"..Game.save_id..".png")
        self.done = true
    end
end

return DrawingMinigame