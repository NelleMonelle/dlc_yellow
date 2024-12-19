---@class TileButton : Event
---@overload fun(...) : TileButton
local QueenVase, super = Class(Event)

function QueenVase:init(x, y, properties)
    super.init(self, x, y)

    properties = properties or {}

    self:setSprite("world/events/steamworks/29_flowers_1")
    self:setOrigin(0.5, 0.5)

    --self:setHitbox(0, 8, 20, 12)

    -- State variables
    self.trampled = false

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

function QueenVase:onCollide(chara)
    if self.trampled == false then
        if chara.is_player or chara.is_follower then
            self:setSprite("world/events/steamworks/29_flowers_2")
            self.trampled = true
            Assets.playSound("step_on_flowers")
        end
    end
end

return QueenVase