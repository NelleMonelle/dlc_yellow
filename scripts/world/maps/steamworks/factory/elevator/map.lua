local Elevator, super = Class(Map)

function Elevator:init(world, data)
    super:init(self, world, data)

end

function Elevator:onEnter()
    super.onEnter(self)
    local light_overlay = Game.world.map:getEvent("stw_factory_elevator_overlay")
    Game.world.timer:after(0.2, function()
        Assets.playSound("electric_flash")
        light_overlay:setSprite("world/events/steamworks/factory_elevator_overlay_2")
    end)
    Game.world.timer:after(0.5, function()
        Assets.playSound("electric_flash")
        light_overlay:setSprite("world/events/steamworks/factory_elevator_overlay_1")
    end)
    Game.world.timer:after(0.7, function()
        Assets.playSound("electric_flash")
        light_overlay:setSprite("world/events/steamworks/factory_elevator_overlay_2")
    end)

    --if Game.world:hasCutscene() then Game.world.cutscene:endCutscene() end
    Game.world:startCutscene(function(cutscene)
        local sf = cutscene:getCharacter("screenface")
        local party1 = Game.world.player
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
        local function setAllFacing(facing)
            for _,member in ipairs(Game.party) do
                local chara = Game.world:getCharacter(member.id)
                if chara then
                    chara.sprite:setFacing(facing)
                end
            end
            --return
        end
        setAllFacing("up")
        cutscene:detachFollowers()
        cutscene:wait(0.1)
        party1:setPosition(320, 390)
        if Game.party[4] then
            cutscene:wait(cutscene:walkTo(party1, party1.x, 264, 0.75, "right"))
            cutscene:wait(cutscene:walkTo(party1, 352, party1.y, 0.25, "down"))
            party2:setPosition(320, 390)
            cutscene:wait(cutscene:walkTo(party2, party2.x, 264, 0.75, "left"))
            cutscene:wait(cutscene:walkTo(party2, 296, party2.y, 0.25, "down"))
            party3:setPosition(320, 390)
            cutscene:wait(cutscene:walkTo(party3, party3.x, 314, 0.25, "right"))
            cutscene:wait(cutscene:walkTo(party3, 352, party3.y, 0.25, "down"))
            party4:setPosition(320, 390)
            cutscene:wait(cutscene:walkTo(party4, party4.x, 314, 0.25, "left"))
            cutscene:wait(cutscene:walkTo(party4, 296, party4.y, 0.25, "down"))
        elseif Game.party[3] then
            cutscene:wait(cutscene:walkTo(party1, party1.x, 264, 0.75, "right"))
            cutscene:wait(cutscene:walkTo(party1, 352, party1.y, 0.25, "down"))
            party2:setPosition(320, 390)
            cutscene:wait(cutscene:walkTo(party2, party2.x, 264, 0.75, "left"))
            cutscene:wait(cutscene:walkTo(party2, 296, party2.y, 0.25, "down"))
            party3:setPosition(320, 390)
            cutscene:wait(cutscene:walkTo(party3, party3.x, 314, 0.25, "down"))
        elseif Game.party[2] then
            cutscene:wait(cutscene:walkTo(party1, party1.x, 264, 0.75, "right"))
            cutscene:wait(cutscene:walkTo(party1, 352, party1.y, 0.25, "down"))
            party2:setPosition(320, 390)
            cutscene:wait(cutscene:walkTo(party2, party2.x, 264, 0.75, "left"))
            cutscene:wait(cutscene:walkTo(party2, 296, party2.y, 0.25, "down"))
        else
            cutscene:wait(cutscene:walkTo(party1, party1.x, 264, 0.75, "down"))
        end
        cutscene:wait(0.5)
        sf:setAnimation("hello")
        cutscene:wait(1.25)
        if not Game:getFlag("factory_elevator_intro_done") then
            Game.world.music:play("mixin_it_up")
            Game.world.music.volume = 1
            setAllFacing("up")
            cutscene:text("[wave:2][color:green]* Heeello!!![wait:5] I welcome you into\nmy body!!!", nil, sf)
            cutscene:text("[wave:2][color:green]* Where ever would you like to\ngo??", nil, sf)
            cutscene:text("[wave:2][color:green]* The available destinations are:", nil, sf)
            cutscene:text("[wave:2][color:green]* \"Offices\"", nil, sf)
            cutscene:text("[wave:2][color:green]* \"Basement\"", nil, sf)
            cutscene:text("[wave:2][color:green]* \"Out of here\"", nil, sf)
            if Game.world:getCharacter("susie_lw") then
                Game.world.music:stop()
                cutscene:text("* Just get us out of here.", "annoyed", "susie")
                cutscene:wait(1)
                cutscene:text("[wave:2][color:green]* Alright then.", nil, sf)
            else
                cutscene:wait(2)
                cutscene:text("[shake:1][color:green]* I hear no answer!", nil, sf)
                cutscene:text("[wave:2][color:green]* In that case we're heading to: \"Out of here\".", nil, sf)
                Game.world.music:stop()
            end
            setAllFacing("down")
            Game:setFlag("factory_elevator_intro_done", true)
        end
        cutscene:wait(0.5)
        Assets.playSound("elevator_door_shut")
        cutscene:wait(0.5)
        Assets.playSound("elevator")
        if Game:getFlag("factory_elevator_destination")=="steamworks/32" then
            sf:setAnimation("up")
        elseif Game:getFlag("factory_elevator_destination")=="steamworks/factory/04" then
            sf:setAnimation("down")
        end
        cutscene:wait(3.7)
        Assets.playSound("ring")
        sf:setAnimation("hello")
        cutscene:wait(0.5)
        Assets.playSound("sliding_door_open")
        cutscene:wait(0.5)
        if Game.party[4] then
            cutscene:wait(cutscene:walkTo(party1, 320, party1.y, 0.25, "down"))
            cutscene:wait(cutscene:walkTo(party1, party1.x, 390, 0.75, "down"))
            party1:fadeOutAndRemove(0.2)
            cutscene:wait(cutscene:walkTo(party2, 320, party2.y, 0.25, "down"))
            cutscene:wait(cutscene:walkTo(party2, party2.x, 390, 0.75, "down"))
            party2:fadeOutAndRemove(0.2)
            cutscene:wait(cutscene:walkTo(party3, 320, party3.y, 0.25, "down"))
            cutscene:wait(cutscene:walkTo(party3, party3.x, 390, 0.75, "down"))
            party3:fadeOutAndRemove(0.2)
            cutscene:wait(cutscene:walkTo(party4, 320, party4.y, 0.25, "down"))
            cutscene:wait(cutscene:walkTo(party4, party4.x, 390, 0.75, "down"))
            party4:fadeOutAndRemove(0.2)
        elseif Game.party[3] then
            cutscene:wait(cutscene:walkTo(party1, 320, party1.y, 0.25, "down"))
            cutscene:wait(cutscene:walkTo(party1, party1.x, 390, 0.75, "down"))
            party1:fadeOutAndRemove(0.2)
            cutscene:wait(cutscene:walkTo(party2, 320, party2.y, 0.25, "down"))
            cutscene:wait(cutscene:walkTo(party2, party2.x, 390, 0.75, "down"))
            party2:fadeOutAndRemove(0.2)
            cutscene:wait(cutscene:walkTo(party3, party3.x, 390, 0.25, "down"))
            party3:fadeOutAndRemove(0.2)
        elseif Game.party[2] then
            cutscene:wait(cutscene:walkTo(party1, 320, party1.y, 0.25, "down"))
            cutscene:wait(cutscene:walkTo(party1, party1.x, 390, 0.75, "down"))
            party1:fadeOutAndRemove(0.2)
            cutscene:wait(cutscene:walkTo(party2, 320, party2.y, 0.25, "down"))
            cutscene:wait(cutscene:walkTo(party2, party2.x, 390, 0.75, "down"))
            party2:fadeOutAndRemove(0.2)
        else
            cutscene:wait(cutscene:walkTo(party1, party1.x, 390, 0.75, "down"))
            party1:fadeOutAndRemove(0.2)
        end
        cutscene:wait(0.5)
        Game.world:mapTransition(Game:getFlag("factory_elevator_destination"), "elevator")
    end)
end

return Elevator