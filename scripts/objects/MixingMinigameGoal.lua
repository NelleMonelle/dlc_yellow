---@class MixingMinigameGoal: Sprite
local MixingMinigameGoal, super = Class(Sprite)

function MixingMinigameGoal:init(x,y)
    super.init(self,"mixing_minigame/puzzle_goal",x,y)
	self.anim_grow = 1
	self:setOrigin(0.5, 0.5)
    self:setHitbox(-3,-3,21,21)
end

function MixingMinigameGoal:update()
    super.update(self)
    local minigame = self.parent
	self.alpha = minigame.alpha
	if minigame.active_fake then
		if self.scale_x > 1.5 and self.anim_grow == 1 then
			self.anim_grow = -1
		elseif self.scale_x < 1 and self.anim_grow == -1 then
			self.anim_grow = 1
		end
		self.scale_x = self.scale_x + (0.05 * self.anim_grow) * DTMULT
		self.scale_y = self.scale_x
	end
end

function MixingMinigameGoal:draw()
    Draw.setColor(1,1,1,self.alpha)
    local minigame = self.parent
    love.graphics.translate(minigame.x_offset,minigame.y_offset)
    super.draw(self)
    if DEBUG_RENDER and self.collider then
        self.collider:draw()
    end
end

return MixingMinigameGoal