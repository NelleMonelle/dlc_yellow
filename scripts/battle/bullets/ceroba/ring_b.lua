local CerobaRingBlue, super = Class(Bullet)

function CerobaRingBlue:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/ceroba/ring_blue")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.collider = PolygonCollider(self, {{27,1},{31,1},{41,5},{48,12},{52,21},{52,31},{48,40},{41,47},{31,51},{22,51},{12,47},{5,40},{1,31},{1,21},{5,12},{12,5},{22,1},{26,1},
    {26,2},{23,2},{12,7},{7,12},{2,22},{2,30},{7,40},{12,45},{23,50},{30,50},{41,45},{46,40},{51,30},{51,22},{46,12},{41,7},{30,2},{27,2}})
    --self:setHitbox(0, 0, self.width, 8)

    self.destroy_on_hit = false
    self:setScale(1, 1)
end

local function condition(soul)
	return (soul.moving_x ~= 0 or soul.moving_y ~= 0)
end

function CerobaRingBlue:onCollide(soul)
	if condition(soul) then
		return super.onCollide(self, soul)
	end
end

function CerobaRingBlue:update()

    local soul = Game.battle.soul
	if not condition(soul) then
		self.grazed = true
	end

    super.update(self)
end

return CerobaRingBlue