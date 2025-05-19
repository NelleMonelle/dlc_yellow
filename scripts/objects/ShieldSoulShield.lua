local ShieldSoulShield, super = Class(Object)

function ShieldSoulShield:init(x, y)
    super:init(self, x, y)

    self.layer = BATTLE_LAYERS["above_bullets"]
    self:setSprite("player/shield")
    self:setScale(2)
    self.collider = Hitbox(self, 0, 0, self.width, 1)
    self.physics = nil

end

function ShieldSoulShield:resolveBulletCollision(bullet)
	Assets.playSound("trash_can_hit")
	bullet:remove()
end

function ShieldSoulShield:update()
    local collided_bullets = {}
    Object.startCache()
    for _,bullet in ipairs(Game.stage:getObjects(Bullet)) do
        if bullet:collidesWith(self.collider) then
            -- Store collided bullets to a table before calling onCollide
            -- to avoid issues with cacheing inside onCollide
            table.insert(collided_bullets, bullet)
        end
    end
    Object.endCache()

    for _,bullet in ipairs(collided_bullets) do
        self:resolveBulletCollision(bullet)
    end
end

function ShieldSoulShield:setSprite(sprite)
    if self.sprite then
        self.sprite:remove()
    end

    self.sprite = Sprite(sprite, 0, 0)
    self:addChild(self.sprite)
    self:setSize(self.sprite:getSize())
end

function ShieldSoulShield:draw()
    super.draw(self)

    if DEBUG_RENDER and self.collider then
        self.collider:drawFor(self, 1, 0, 0)
    end
end

return ShieldSoulShield