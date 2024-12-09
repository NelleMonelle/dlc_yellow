local CerobaRingOrange, super = Class(Bullet)

function CerobaRingOrange:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/ceroba/ring_orange")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.collider = PolygonCollider(self, {{27,1},{31,1},{31,2},{35,2},{35,3},{37,3},{37,4},{39,4},{39,5},{41,5},{48,12},{48,13},{50,15},{50,18},{51,18},{51,21},{52,21},{52,31},{51,31},{51,34},{50,34},{50,37},{48,39},{48,40},{41,47},{39,47},{39,48},{27,51}})
    --self:setHitbox(0, 0, self.width, 8)

    self.destroy_on_hit = false
    self:setScale(1, 1)
end

local function condition(soul)
	return (soul.moving_x == 0 and soul.moving_y == 0)
end

function CerobaRingOrange:onCollide(soul)
	if condition(soul) then
		return super.onCollide(self, soul)
	end
end

function CerobaRingOrange:update()

    local soul = Game.battle.soul
	if not condition(soul) then
		self.grazed = true
	end

    super.update(self)
end

return CerobaRingOrange