local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    Game.battle:swapSoul(SlipperySoul())
	local arena = Game.battle.arena
	self.warning = Sprite("battle/bullets/jandroid/warning_slippery_floor", arena.left-25, arena.y)
	self.warning:setOrigin(1, 0.5)
	self.warning:play(15/30)	
	self.warning.alpha = 0
	self.warning.layer = 8999
	Game.battle:addChild(self.warning)
end

function Basic:onEnd()
	self.warning:remove()
	Game.battle.timer:cancel(Game.battle.soul.timer)
	for _,afterimage in ipairs(Game.battle.soul.afterimages) do
		afterimage:remove()
	end
	Game.battle:swapSoul(LightSoul())
	Game.battle.soul.visible = false
end

function Basic:update()
    super.update(self)
	local arena = Game.battle.arena
	self.warning.x = arena.left-25
	if self.warning.alpha < 0.99 then
		self.warning.alpha = Utils.lerp(self.warning.alpha, 1, 0.1)
	else
		self.warning.alpha = 1
	end
end

return Basic