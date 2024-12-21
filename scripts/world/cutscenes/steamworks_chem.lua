return {
    reception = function(cutscene, event)
        if Game:getFlag("got_steamworks_id") then
            cutscene:text("* (You notice a sign in the\nreceptionist office.)")
            cutscene:text("* Do not eat the writing\nutensils! Not again...")
            cutscene:text("* (You wonder what tragic event\nwarranted this sign.)")
        else
            cutscene:text("* (The receptionist is\nunreceptive.)")
            cutscene:text("* (They seemed to be in the\nmiddle of creating a new\nSteamworks ID.)")
            local opinion = cutscene:textChoicer("* (Finish their work?)\n", {"Yes", "    No"})
            if opinion == 1 then
                Game.world.music:fade(0, 0.5)
                local minigame = Game.world:spawnObject(DrawingMinigame("id_minigame/crayon_id"))
                cutscene:wait(function() return minigame.done end)
                Game.world.music:fade(1, 0.5)
                Game.inventory:addItem("steamworks_id")
                Game:setFlag("got_steamworks_id", true)
            end
        end
    end
}
