local Soap, super = Class(LightBullet)

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
	local jandroids = Game.battle:getEnemyBattler("jandroid")
	member:heal(4)
    Game.battle:getEnemyBattler("jandroid"):addMercy(100)
	local is_right = false
	local bubble = jandroids:spawnSpeechBubble(Utils.pick({"EW!!! Soap???? ","No!!\nYou diSGuST ME!\nGet away!!"}), {right=is_right})
	bubble:setSkippable(false)
	bubble:setAdvance(false)
	self:remove()
end

return Soap