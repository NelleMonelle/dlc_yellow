local Elevator, super = Class(Event)

function Elevator:init(data)
    super.init(self, data)

    self:setOrigin(0.5, 1)
    self:setSprite("world/events/steamworks/factory_04_elevator_1")

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

function Elevator:onInteract(chara, dir)
    Game.world:startCutscene(function(cutscene)
        if Game.world.map.id == "steamworks/factory/04" then
            Game:setFlag("factory_elevator_destination", "steamworks/32")
        elseif Game.world.map.id == "steamworks/32" then
            Game:setFlag("factory_elevator_destination", "steamworks/factory/04")
        end
        local party2
        local party3
        local party4
        if Game.party[2] then
            party2 = cutscene:getCharacter(Game.party[2].id)
        end
        if Game.party[3] then
            party3 = cutscene:getCharacter(Game.party[3].id)
        end
        if Game.party[4] then
            party4 = cutscene:getCharacter(Game.party[4].id)
        end
        cutscene:detachFollowers()
        self:setSprite("world/events/steamworks/factory_04_elevator", 1/9)
        Assets.playSound("sliding_door_open")
        cutscene:wait(0.66)
        self:setSprite("world/events/steamworks/factory_04_elevator_6")
        cutscene:wait(cutscene:walkTo(Game.world.player, self.x, Game.world.player.y, 0.1, "up"))
        cutscene:wait(cutscene:walkTo(Game.world.player, Game.world.player.x, self.y - 8, 0.3, "up"))
        Game.world.player:fadeOutAndRemove(0.2)
        cutscene:wait(0.2)
        if Game.party[2] then
            cutscene:wait(cutscene:walkTo(party2, self.x, party2.y, 0.3, "up"))
            cutscene:wait(cutscene:walkTo(party2, party2.x, self.y - 8, 0.4, "up"))
            party2:fadeOutAndRemove(0.2)
            cutscene:wait(0.2)
        end
        if Game.party[3] then
            cutscene:wait(cutscene:walkTo(party3, self.x, party3.y, 0.3, "up"))
            cutscene:wait(cutscene:walkTo(party3, party3.x, self.y - 8, 0.4, "up"))
            party3:fadeOutAndRemove(0.2)
            cutscene:wait(0.2)
        end
        if Game.party[4] then
            cutscene:wait(cutscene:walkTo(party4, self.x, party4.y, 0.3, "up"))
            cutscene:wait(cutscene:walkTo(party4, party4.x, self.y - 8, 0.4, "up"))
            party4:fadeOutAndRemove(0.2)
            cutscene:wait(0.2)
        end
        Game.world:mapTransition("steamworks/factory/elevator")
    end)
    return true
end

return Elevator