local ShieldSoulShield, super = Class(Sprite)

function ShieldSoulShield:init(x, y)
    super.init(self, "player/shield", x, y)
    self:setOriginExact(9, 0)
    self:setScale(2)
    self.layer = BATTLE_LAYERS["above_bullets"]
    self.collider = Hitbox(self, 0, 0, self.width, 1)
end

function ShieldSoulShield:resolveBulletCollision(bullet)
    if bullet.shield_immune then
        return
    end
    bullet:onShieldCollision()
	Assets.playSound("trash_can_hit", 1, MathUtils.random(0.7, 1.3))
    Game.battle.soul:offsetShield()
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

function ShieldSoulShield:draw()
    super.draw(self)

    if DEBUG_RENDER and self.collider then
        self.collider:drawFor(self, 1, 0, 0)
    end
end

return ShieldSoulShield