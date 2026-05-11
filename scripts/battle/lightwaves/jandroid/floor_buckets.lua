local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self:setArenaSize(160, 100)
    self.time = 7
    self.enemies = self:getAttackers()
	if #self.enemies >= 2 then
	    self.time = 8
	end
	self.exclude = 1
end

function Basic:onStart()
	local arena = Game.battle.arena
	self.timer:script(function(wait)
		wait(15/30)
		if #self.enemies < 2 then
			self:spawnBullet("warning", arena.left+10, arena.top+24, 0, 0)
			self:spawnBullet("warning", arena.right-10, arena.y, 0, 0)
			self:spawnBullet("warning", arena.left+10, arena.bottom-24, 0, 0)
			wait(4/30)
			Assets.playSound("bombfall")
			wait(3/30)
			Assets.playSound("bombfall")
			wait(3/30)
			Assets.playSound("bombfall")
			wait(5/30)
			while true do
				self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.left-20, arena.top+20, 3)
				self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.right+20, arena.y, 3)
				self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.left-20, arena.bottom-20, 3)
				wait(40/30)
			end
		else
			while true do
				self.exclude = Utils.random(1,6,0.5)
				if self.exclude ~= 1 then
					self:spawnBullet("warning", arena.left+10, arena.top+24, 0, 0)
				end
				if self.exclude ~= 2 then
					self:spawnBullet("warning", arena.right-10, arena.y, 0, 0)
				end
				if self.exclude ~= 3 then
					self:spawnBullet("warning", arena.left+10, arena.bottom-24, 0, 0)
				end
				if self.exclude ~= 4 then
					self:spawnBullet("warning", arena.left+20, arena.top-20, 0, 0)
				end
				if self.exclude ~= 5 then
					self:spawnBullet("warning", arena.x, arena.bottom+20, 0, 0)
				end
				if self.exclude ~= 6 then
					self:spawnBullet("warning", arena.right-20, arena.top-20, 0, 0)
				end
				wait(4/30)
				Assets.playSound("bombfall")
				wait(3/30)
				Assets.playSound("bombfall")
				wait(3/30)
				Assets.playSound("bombfall")
				wait(5/30)
				if self.exclude ~= 1 then
					self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.left-20, arena.top+20, 3)
				end
				if self.exclude ~= 2 then
					self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.right+20, arena.y, 3)
				end
				if self.exclude ~= 3 then
					self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.left-20, arena.bottom-20, 3)
				end
				if self.exclude ~= 4 then
					self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.left+20, arena.top-20, 3)
				end
				if self.exclude ~= 5 then
					self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.x, arena.bottom+20, 3)
				end
				if self.exclude ~= 6 then
					self:spawnBulletTo(Game.battle.mask, "jandroid/floor_bucket", arena.right-20, arena.top-20, 3)
				end
				wait(40/30)
			end
		end
	end)
end

return Basic