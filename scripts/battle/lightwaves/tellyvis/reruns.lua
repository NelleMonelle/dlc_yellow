local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    --[[self:setArenaSize(160, 160)
    self:setArenaPosition(319, 360)]]
    self.time = -1
    self.enemies = self:getAttackers()
	self.attack_count = 1
	self.dialogue = {"Seen it!", "I hate\nreruns!", "They'll reboot\nanything\nnowadays!", "Gimme something\nnew!"}
	self.bubble = nil
	self.rerun_timer = nil
	self.rerun_timer_2 = nil
	self.bulletid = 0
	self.block_prevpos = -1
end

local function doRerun(self, wait, enemy, atk)
	-- local enemy = self.enemy
	if atk == "rudinn" then
		self.rerun_timer = self.timer:every(12/30, function()
        for _, attacker in ipairs(self:getAttackers()) do
            local soul = Game.battle.soul
			
            local dir = 30 + MathUtils.random(120)
            local radius = 140 + MathUtils.random(80)
            local x = math.cos(math.rad(-dir)) * radius
            local y = math.sin(math.rad(-dir)) * radius
		
            local diamond = self:spawnBullet("tellyvis/reruns/diamond_black", soul.x + x, soul.y + y)
        end
    end)
		wait(2.75)
	end
	if atk == "hathy" then
		local x = Game.battle.soul.x
		local y = Game.battle.soul.y
		self:spawnBullet("tellyvis/reruns/spinheart", x, y, math.rad(0))
		wait(2.5)
	end
	if atk == "jigsawry" then
		if Utils.pick({0,1}) == 0 then
			local x = Game.battle.soul.x
			local y1 = Game.battle.arena.y - 150
			local y2 = Game.battle.arena.y + 150

			local bullet = self:spawnBullet("tellyvis/reruns/jigsaw", x, y1)
			bullet.side = 3
			bullet.bid = self.bulletid
			self.bulletid = self.bulletid + 1
			local bullet = self:spawnBullet("tellyvis/reruns/jigsaw", x, y2)
			bullet.side = 1
			bullet.bid = self.bulletid
			self.bulletid = self.bulletid + 1
		else
			local y = Game.battle.soul.y
			local x1 = Game.battle.arena.x - 150
			local x2 = Game.battle.arena.x + 150

			local bullet = self:spawnBullet("tellyvis/reruns/jigsaw", x1, y)
			bullet.side = 2
			bullet.bid = self.bulletid
			self.bulletid = self.bulletid + 1
			local bullet = self:spawnBullet("tellyvis/reruns/jigsaw", x2, y)
			bullet.side = 0
			bullet.bid = self.bulletid
			self.bulletid = self.bulletid + 1
		end
		self.rerun_timer = self.timer:every(0.75, function()
			if Utils.pick({0,1}) == 0 then
				local x = Game.battle.soul.x
				local y1 = Game.battle.arena.y - 150
				local y2 = Game.battle.arena.y + 150

				local bullet = self:spawnBullet("tellyvis/reruns/jigsaw", x, y1)
				bullet.side = 3
				bullet.bid = self.bulletid
				self.bulletid = self.bulletid + 1
				local bullet = self:spawnBullet("tellyvis/reruns/jigsaw", x, y2)
				bullet.side = 1
				bullet.bid = self.bulletid
				self.bulletid = self.bulletid + 1
			else
				local y = Game.battle.soul.y
				local x1 = Game.battle.arena.x - 150
				local x2 = Game.battle.arena.x + 150

				local bullet = self:spawnBullet("tellyvis/reruns/jigsaw", x1, y)
				bullet.side = 2
				bullet.bid = self.bulletid
				self.bulletid = self.bulletid + 1
				local bullet = self:spawnBullet("tellyvis/reruns/jigsaw", x2, y)
				bullet.side = 0
				bullet.bid = self.bulletid
				self.bulletid = self.bulletid + 1
			end
		end)
		wait(3.25)
	end
	if atk == "bloxer" then
		self.rerun_timer = self.timer:every(0.5, function()
			local pos = Utils.pick({0,1,2,3,4})
			if pos == self.block_prevpos then
				pos = Utils.pick({0,1,2,3,4})
			end
			self.block_prevpos = pos
			local bullet = self:spawnBullet("tellyvis/reruns/blockfall", 100, 100)
			bullet.xpos = pos
		end)
		wait(3.5)
	end
	if atk == "rabbick" then
		local x = Game.battle.arena.right
		local y = Game.battle.arena.y
		self:spawnBullet("tellyvis/reruns/rabbit", x, y)
		self.rerun_timer = self.timer:every(1.25, function()
			local x = Game.battle.arena.right
			local y = Game.battle.arena.y
			self:spawnBullet("tellyvis/reruns/rabbit", x, y)
		end)
		wait(3.5)
	end
	if atk == "clover" then
		local dir = Utils.pick({225, 315})
		local xx = math.cos(math.rad(dir))*400
		local yy = math.sin(math.rad(dir))*400
		local bullet = self:spawnBullet("tellyvis/reruns/clubs_black", Game.battle.soul.x+xx, Game.battle.soul.y+yy)
		bullet.rotation = math.rad(dir-180)
		self.rerun_timer_2 = self.timer:script(function(wait)
			wait(15/30)
			for i = 1, 3 do
				local bullet2 = self:spawnBullet("tellyvis/reruns/clubs_ball", bullet.x, bullet.y, bullet.rotation, bullet.rotation, "b")
				bullet2:setLayer(bullet.layer - 0.01)
				local bullet3 = self:spawnBullet("tellyvis/reruns/clubs_ball", bullet.x, bullet.y, bullet.rotation+math.rad(17), bullet.rotation, "c")
				bullet3:setLayer(bullet.layer - 0.01)
				local bullet4 = self:spawnBullet("tellyvis/reruns/clubs_ball", bullet.x, bullet.y, bullet.rotation-math.rad(17), bullet.rotation, "a")
				bullet4:setLayer(bullet.layer - 0.01)
				wait(4/30)
			end
			wait(2/30)
			bullet:fadeOutAndRemove(0.2)
		end)
		self.rerun_timer = self.timer:every(1.0, function()
			local dir = Utils.pick({225, 315})
			local xx = math.cos(math.rad(dir))*400
			local yy = math.sin(math.rad(dir))*400
			local bullet = self:spawnBullet("tellyvis/reruns/clubs_black", Game.battle.soul.x+xx, Game.battle.soul.y+yy)
			bullet.rotation = math.rad(dir-180)
			self.rerun_timer_2 = self.timer:script(function(wait)
				wait(15/30)
				for i = 1, 3 do
					local bullet2 = self:spawnBullet("tellyvis/reruns/clubs_ball", bullet.x, bullet.y, bullet.rotation, bullet.rotation, "b")
					bullet2:setLayer(bullet.layer - 0.01)
					local bullet3 = self:spawnBullet("tellyvis/reruns/clubs_ball", bullet.x, bullet.y, bullet.rotation+math.rad(17), bullet.rotation, "c")
					bullet3:setLayer(bullet.layer - 0.01)
					local bullet4 = self:spawnBullet("tellyvis/reruns/clubs_ball", bullet.x, bullet.y, bullet.rotation-math.rad(17), bullet.rotation, "a")
					bullet4:setLayer(bullet.layer - 0.01)
					wait(4/30)
				end
				wait(2/30)
				bullet:fadeOutAndRemove(0.2)
			end)
		end)
		wait(2.75)
	end
	if atk == "lancer" then
		self.rerun_timer = self.timer:every(9/30, function()
			local xx = Game.battle.arena.left-80
			if self.side == 1 then
				xx = Game.battle.arena.right+80
			end
			local yy = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
			local rot = 0
			if self.side == 1 then
				rot = math.rad(180)
			end
			self:spawnBullet("tellyvis/reruns/spade", xx, yy, rot)
			if self.side == 0 then
				self.side = 1
			else
				self.side = 0
			end
		end)
		wait(3.25)
	end
end

function Basic:onEnd()
	if self.bubble then
		self.bubble:remove()
	end
	if self.rerun_timer then
		self.timer:cancel(self.rerun_timer)
	end
	if self.rerun_timer_2 then
		self.timer:cancel(self.rerun_timer_2)
	end
	for _, enemy in ipairs(self.enemies) do
		local body = enemy.actor:getLightBattlerPart("body").sprite
		body:setSprite(enemy.actor.path.."/body")
	end
end

function Basic:onStart()
	for _, enemy in ipairs(self.enemies) do
		local body = enemy.actor:getLightBattlerPart("body").sprite
		body:setSprite(enemy.actor.path.."/remote_1")
	
		self.timer:script(function(wait)
			body:setFrame(1)
			wait(5/30)
			body:setFrame(2)
			wait(5/30)
			body:setFrame(3)
			wait(5/30)
			body:setFrame(4)
			wait(5/30)
			body:setSprite(enemy.actor.path.."/remote_2")
			body:setFrame(3)
			wait(15/30)
			while true do
				body:setFrame(1)
				wait(5/30)
				body:setFrame(2)
				wait(5/30)
				body:setFrame(3)
				self.bubble = enemy:spawnSpeechBubble(self.dialogue[((self.attack_count - 1) % 4) + 1])
				self.bubble:setSkippable(false)
				self.bubble:setAdvance(false)
				doRerun(self, wait, enemy, Utils.pick({"rudinn", "hathy", "jigsawry", "bloxer", "rabbick", "clover", "lancer"}))
				--doRerun(self, wait, enemy, "lancer")
				if self.rerun_timer then
					self.timer:cancel(self.rerun_timer)
					self.rerun_timer = nil
				end
				if self.rerun_timer_2 then
					self.timer:cancel(self.rerun_timer_2)
					self.rerun_timer_2 = nil
				end
				self:clear()
				self.bulletid = 0
				self.block_prevpos = -1
				self.side = 0
				self.attack_count = self.attack_count + 1
				if self.attack_count >= 5 then
					self.finished = true
				end
				self.bubble:remove()
			end
		end)
	end
end

function Basic:update()
    super.update(self)
end

return Basic