local ArenaFlash, super = Class(Bullet)

function ArenaFlash:init(x, y)
    super.init(self, x, y)

    self.destroy_on_hit = false
	self.collider = Hitbox(self, 0, 0, 640, 480)
end

function ArenaFlash:update()
    super.update(self)
	Game.battle.timer:after(1, function() self:remove() end)
end

function ArenaFlash:draw()
    Draw.setColor({1, 1, 1})
	love.graphics.rectangle("fill", 0, 0, 640, 480)
    super.draw(self)
end

return ArenaFlash