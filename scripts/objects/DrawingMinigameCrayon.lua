---@class DrawingMinigameCrayon: Sprite
local DrawingMinigameCrayon, super = Class(Sprite)

-- TODO: get the actual colors for 3-8
local crayon_colors = {
    {213/255, 222/255,231/255},
    {137/255, 163/255, 187/255},
    {0,0,1},
    {0,1,0},
    {1,1,0},
    {1,0,0},
    {.5,0,0},
    {.2,0,0},
}

function DrawingMinigameCrayon:init(color_id,x,y)
    super.init(self,"id_minigame/crayon_"..color_id, x,y)
    self.color_id = color_id
    self:setHitbox(8,15,6.5,40)
end

function DrawingMinigameCrayon:update()
    super.update(self)
    ---@type DrawingMinigame
    ---@diagnostic disable-next-line: assign-type-mismatch
    local minigame = self.parent.parent
    if self:collidesWith(minigame.cursor) and (Input.mousePressed(1) or Input.pressed("confirm")) then
        minigame.current_color = crayon_colors[self.color_id]
        Assets.playSound("crayon_select")
    end
end

function DrawingMinigameCrayon:draw()
    ---@type DrawingMinigame
    ---@diagnostic disable-next-line: assign-type-mismatch
    local minigame = self.parent.parent
    if self:collidesWith(minigame.cursor) then
        love.graphics.translate(0,-5)
    end
    super.draw(self)
    if DEBUG_RENDER and self.collider then
        self.collider:draw()
    end
end

return DrawingMinigameCrayon