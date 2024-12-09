local Elevator, super = Class(Event)

function Elevator:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 1)
    self:setSprite("world/maps/steamworks/37_elevator_1")

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

function Elevator:onInteract(chara, dir)
    Game.world:startCutscene(function(cutscene)
        Assets.playSound("elevator_open_stw")
        self:setSprite("world/maps/steamworks/37_elevator", 1/10)
        cutscene:wait(1.3)
        self:setSprite("world/maps/steamworks/37_elevator_13")
        cutscene:wait(cutscene:walkTo(Game.world.player, self.x, Game.world.player.y, 0.25, "up"))
        cutscene:wait(cutscene:walkTo(Game.world.player, self.x, self.y - 26, 0.25, "up"))
        --cutscene:mapTransition("hotland/elevator")
    end)
    return true
end

return Elevator