local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
	
	self.danger_collider = nil
end

function Basic:onStart()
	self.danger_collider = ColliderGroup(self, {
		Hitbox(self, Game.battle.arena.left, Game.battle.arena.top, Game.battle.arena.width, 1),
		Hitbox(self, Game.battle.arena.left, Game.battle.arena.top, 1, Game.battle.arena.height),
		Hitbox(self, Game.battle.arena.left, Game.battle.arena.top+Game.battle.arena.height-1, Game.battle.arena.width, 1),
		Hitbox(self, Game.battle.arena.left+Game.battle.arena.width-1, Game.battle.arena.top, 1, Game.battle.arena.height),
	})
end

function Basic:update()

    super.update(self)
	
	if not self.danger_collider then return end
	if self.danger_collider:collidesWith(Game.battle.soul) then
		if Game.battle.soul.inv_timer > 0 then else
			Game.battle.soul.inv_timer = (4/3)
			Assets.playSound("ceroba_hurt_red")
			local alive_battlers = Utils.filter(Game.battle.party, function(battler) return not battler.is_down end)
			for _,battler in ipairs(alive_battlers) do
				battler:hurt(3, true)
				Assets.stopSound("hurt")
				if battler.chara:getHealth() <= 0 then
					battler.chara:setHealth(0)
					local zero_health = (battler.chara:getBaseStat("health") or 0) + battler.chara:getEquipmentBonus("health")
					battler.chara:setStatBuff("health", -zero_health)
				else
					battler.chara:addStatBuff("health", -3)
				end
			end
		end
	end
end

function Basic:draw()
	super.draw(self)
	if DEBUG_RENDER and self.danger_collider then
        self.danger_collider:draw(1, 0, 0)
    end
end

return Basic