---@class MixingMinigame: Object
local MixingMinigame, super = Class(Object)

function MixingMinigame:init()
    super.init(self,0,0, SCREEN_WIDTH, SCREEN_HEIGHT)
	self.alpha = 0
	self.draw_alpha = 0
	self.active_fake = false
	self.state = "GUIDE"
    self:setScale(2)
    self:setParallax(0)
	self.player = nil
	self.goal = nil
	self.puzzle_start = {}
	self.puzzle_start[1] = {72, 65, 90}
	self.puzzle_start[2] = {70, 165, 0}
	self.puzzle_start[3] = {160, 170, 270}
	self.puzzle_goal = {}
	self.puzzle_goal[1] = {249, 150}
	self.puzzle_goal[2] = {249, 150}
	self.puzzle_goal[3] = {68, 168}
	self.puzzle_1_colliders = {
		Hitbox(self, 58, 38, 16*2, 16),
		Hitbox(self, 90, 38, 16, 16*6),
		Hitbox(self, 42, 38, 16, 16*10),
		Hitbox(self, 58, 182, 16*14, 16),
		Hitbox(self, 106, 118, 16*5, 16),
		Hitbox(self, 170, 54, 16, 16*4),
		Hitbox(self, 186, 54, 16*6, 16),
		Hitbox(self, 266, 70, 16, 16*7),
		Hitbox(self, 234, 166, 16*2, 16),
		Hitbox(self, 234, 166, 16*2, 16),
		Hitbox(self, 154, 150, 16, 16),
		Hitbox(self, 90, 166, 16, 16),
	}
	self.puzzle_2_colliders = {
		Hitbox(self, 58, 54, 16, 16),
		Hitbox(self, 58, 38, 16*11, 16),
		Hitbox(self, 218, 54, 16, 16*5),
		Hitbox(self, 42, 38, 16, 16*10),
		Hitbox(self, 234, 118, 16*3, 16),
		Hitbox(self, 266, 134, 16, 16*3),
		Hitbox(self, 202, 150, 16, 16),
		Hitbox(self, 186, 166, 16*5, 16),
		Hitbox(self, 186, 70, 16, 16*6),
		Hitbox(self, 90, 86, 16*6, 16),
		Hitbox(self, 122, 54, 16, 16),
		Hitbox(self, 58, 118, 16, 16),
		Hitbox(self, 58, 134, 16*2, 16),
		Hitbox(self, 58, 182, 16*5, 16),
		Hitbox(self, 122, 102, 16, 16*5),
	}
	self.puzzle_3_colliders = {
		Hitbox(self, 58, 54, 16, 16),
		Hitbox(self, 58, 38, 16*14, 16),
		Hitbox(self, 266, 54, 16, 16*5),
		Hitbox(self, 186, 118, 16*5, 16),
		Hitbox(self, 250, 102, 16, 16),
		Hitbox(self, 218, 86, 16, 16),
		Hitbox(self, 186, 102, 16, 16),
		Hitbox(self, 170, 134, 16, 16),
		Hitbox(self, 138, 134, 16, 16),
		Hitbox(self, 122, 102, 16, 16*6),
		Hitbox(self, 138, 182, 16*4, 16),
		Hitbox(self, 186, 134, 16, 16*3),
		Hitbox(self, 122, 54, 16, 16*2),
		Hitbox(self, 42, 38, 16, 16*10),
		Hitbox(self, 58, 182, 16*3, 16),
		Hitbox(self, 90, 102, 16, 16*5),
		Hitbox(self, 106, 102, 16, 16),
		Hitbox(self, 58, 134, 16, 16),
		Hitbox(self, 90, 70, 16, 16*2),
		Hitbox(self, 154, 70, 16*6, 16),
		Hitbox(self, 154, 86, 16, 16*2),
		Hitbox(self, 138, 102, 16, 16),
		Hitbox(self, 74, 102, 16, 16),
	}
	self.puzzle_collider = nil
	self.puzzle_overlay = Assets.getTexture("mixing_minigame/puzzle_overlay")
	self.puzzle_guide = Assets.getTexture("mixing_minigame/puzzle_guide")
	self.puzzle_sprite = Assets.getFrames("mixing_minigame/puzzle")
	self.font = Assets.getFont("main")
	self.x_offset = 0
	self.y_offset = 0
	self.offset_max = 0
	self.countdown_current = 4
	self.puzzle_current = nil
	self.mus = nil
end

function MixingMinigame:draw()
	Draw.setColor(1,1,1,self.alpha)
    love.graphics.translate(self.x_offset,self.y_offset)
    Draw.draw(self.puzzle_overlay)
	if self.state == "GUIDE" then
		Draw.draw(self.puzzle_guide)
	elseif self.state == "COUNTDOWN" then
        love.graphics.setFont(self.font)
        love.graphics.setColor(0,1,0,self.alpha)
		if self.countdown_current >= 4 then
			love.graphics.printf("   INITIALIZING...", 0, 120-15, 640, "center", 0, 0.5, 0.5)
		else
			love.graphics.printf(self.countdown_current, 0, 120-35, 160, "center", 0, 2, 2)
		end
	elseif self.state == "GAMEPLAY" then
		Draw.setColor(1,1,1,self.alpha)
		Draw.draw(self.puzzle_sprite[self.puzzle_current])
		Draw.setColor(0,0,0,self.draw_alpha)
		love.graphics.rectangle("fill", 42, 38, 240, 160)
	elseif self.state == "WIN" then
        love.graphics.setFont(self.font)
        love.graphics.setColor(0,1,0,self.alpha)
		love.graphics.printf("MIX SUCCESSFUL", 0, 120-15, 640, "center", 0, 0.5, 0.5)
	end
    if DEBUG_RENDER and self.puzzle_collider then
		Draw.setColor(1,0,0,self.alpha)
        self.puzzle_collider:draw()
    end
    super.draw(self)
end

function MixingMinigame:hitWall()
	self.player.x = self.puzzle_start[self.puzzle_current][1]
	self.player.y = self.puzzle_start[self.puzzle_current][2]
	self.player.rotation = math.rad(self.puzzle_start[self.puzzle_current][3])
	self.goal.x = self.puzzle_goal[self.puzzle_current][1]
	self.goal.y = self.puzzle_goal[self.puzzle_current][2]
	self.goal.scale_x = 1
	self.goal.anim_grow = 1
	self.goal.layer = self.layer + 0.01
	self.player.moving = false
	self.player.physics.speed = 0
	self.offset_max = 3
	self.draw_alpha = 0.5
	Game.world.timer:after(20/30, function()
		Assets.playSound("chem_start")
		self.player.moving = true
		self.player.physics.speed = 4
		self.draw_alpha = 0
	end)
end

function MixingMinigame:hitGoal()
	self.player:remove()
	self.player = nil
	self.goal:remove()
	self.goal = nil
	if self.puzzle_current < 3 then
		self.puzzle_current = self.puzzle_current + 1
		self.state = "COUNTDOWN"
		Game.world.timer:script(function(wait)
			wait(0.5)
			self.countdown_current = 3
			Assets.playSound("chem_countdown")
			wait(1)
			self.countdown_current = 2
			Assets.playSound("chem_countdown")
			wait(1)
			self.countdown_current = 1
			Assets.playSound("chem_countdown")
			wait(1)
			self.draw_alpha = 0.5
			local collider = self.puzzle_2_colliders
			if self.puzzle_current == 3 then
				collider = self.puzzle_3_colliders
			end
			self.puzzle_collider = ColliderGroup(self, collider)
			self.state = "GAMEPLAY"
			self.player = self:addChild(MixingMinigamePlayer(self.puzzle_start[self.puzzle_current][1], self.puzzle_start[self.puzzle_current][2], self.puzzle_start[self.puzzle_current][3]))
			self.player.layer = self.layer + 0.01
			self.goal = self:addChild(MixingMinigameGoal(self.puzzle_goal[self.puzzle_current][1],self.puzzle_goal[self.puzzle_current][2]))
			self.goal.layer = self.layer + 0.01
			Assets.playSound("chem_go")
			self.countdown_current = 4
			wait(1)
			Assets.playSound("chem_start")
			self.player.moving = true
			self.player.physics.speed = 4
			self.draw_alpha = 0
		end)
	else
		self.state = "WIN"
		Game.world.timer:after(20/30, function()
			self.done = true
			self.active_fake = false
		end)
	end
end

function MixingMinigame:update()
	super.update(self)
	if self.active_fake then
		if self.offset_max > 0 then
			self.x_offset = Utils.random(-self.offset_max, self.offset_max)
			self.y_offset = Utils.random(-self.offset_max, self.offset_max)
			self.offset_max = self.offset_max - 0.2
		else
			self.offset_max = 0
		end
		if self.state == "GUIDE" then
			if Input.pressed("confirm") or Input.pressed("cancel") then
				self.state = "COUNTDOWN"
				Game.world.timer:script(function(wait)
					wait(0.5)
					self.countdown_current = 3
					Assets.playSound("chem_countdown")
					wait(1)
					self.countdown_current = 2
					Assets.playSound("chem_countdown")
					wait(1)
					self.countdown_current = 1
					Assets.playSound("chem_countdown")
					wait(1)
					self.draw_alpha = 0.5
					self.puzzle_current = 1
					self.puzzle_collider = ColliderGroup(self, self.puzzle_1_colliders)
					self.state = "GAMEPLAY"
					self.player = self:addChild(MixingMinigamePlayer(self.puzzle_start[self.puzzle_current][1], self.puzzle_start[self.puzzle_current][2], self.puzzle_start[self.puzzle_current][3]))
					self.player.layer = self.layer + 0.01
					self.goal = self:addChild(MixingMinigameGoal(self.puzzle_goal[self.puzzle_current][1],self.puzzle_goal[self.puzzle_current][2]))
					self.goal.layer = self.layer + 0.01
					self.mus = Music("mixin_it_up")
					Assets.playSound("chem_go")
					self.countdown_current = 4
					wait(1)
					Assets.playSound("chem_start")
					self.player.moving = true
					self.player.physics.speed = 4
					self.draw_alpha = 0
				end)
			end
		end
	end
end

return MixingMinigame