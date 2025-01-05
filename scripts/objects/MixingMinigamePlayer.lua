---@class MixingMinigamePlayer: Sprite
local MixingMinigamePlayer, super = Class(Sprite)

function MixingMinigamePlayer:init(x,y,angle)
    super.init(self,"mixing_minigame/puzzle_player",x,y)
	self.rotation = math.rad(angle or 0)
	self.physics.match_rotation = true
	self:setOriginExact(5, 5)
    self:setHitbox(3,3,4,4)
	self.moving = false
end

function MixingMinigamePlayer:update()
    super.update(self)
    local minigame = self.parent
	self.alpha = minigame.alpha
	if minigame.active_fake and self.moving then
		if Input.pressed("left") then
			self.rotation = math.rad(180)
		end
		if Input.pressed("up") then
			self.rotation = math.rad(270)
		end
		if Input.pressed("right") then
			self.rotation = math.rad(0)
		end
		if Input.pressed("down") then
			self.rotation = math.rad(90)
		end
		if self:collidesWith(minigame.goal) then
			Assets.playSound("chem_win")
			minigame:hitGoal()
		elseif self:collidesWith(minigame.puzzle_collider) and not NOCLIP then
			Assets.playSound("chem_crash")
			minigame:hitWall()
		end
	end
end

function MixingMinigamePlayer:draw()
    Draw.setColor(1,1,1,self.alpha)
    local minigame = self.parent
    love.graphics.translate(minigame.x_offset,minigame.y_offset)
    super.draw(self)
    if DEBUG_RENDER and self.collider then
        self.collider:draw()
    end
end

return MixingMinigamePlayer