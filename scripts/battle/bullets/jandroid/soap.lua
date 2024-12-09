local Soap, super = Class(Bullet)

function Soap:init(x, y, dir, speed)
    super.init(self, x, y, "battle/bullets/jandroid/garbage_soap")

    self:setScale(1, 1)

    self.physics.direction = dir
    self.physics.speed = speed
end

function Soap:update()

    super.update(self)
end

function Soap:onCollide(soul)
	local member = Utils.pick(Game.battle.party)
	member:heal(4)
    Game.battle:getEnemyBattler("jandroid"):addMercy(100)

	self:remove()
end

return Soap