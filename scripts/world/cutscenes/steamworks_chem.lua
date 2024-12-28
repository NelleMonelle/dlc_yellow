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
                Game.world.music:fade(0, 10/30)
				local cursor_hack = Kristal.Config["alwaysShowCursor"] -- God damn it
				Kristal.Config["alwaysShowCursor"] = false
                local minigame = Game.world:spawnObject(DrawingMinigame("id_minigame/crayon_id", "stworks_id"), WORLD_LAYERS["ui"])
                minigame.alpha = 0
                cutscene.world.timer:tween(10/30, minigame, {alpha = 1})
                cutscene:wait(1/30)
                local mus = Music("build_a_bot")
                minigame.active_fake = true

                cutscene:wait(function() return minigame.done end)
                minigame:fadeOutAndRemove(10/30)
                mus:fade(0, 1)
                cutscene:wait(1)
                mus:remove()
                Game.world.music:fade(1, 1)
				Kristal.Config["alwaysShowCursor"] = cursor_hack
                Game.inventory:addItem("steamworks_id")
                Game:setFlag("got_steamworks_id", true)
            end
        end
    end,
    cake = function(cutscene, event)
        if Game:getFlag("chem_got_cake") then
            cutscene:text("* (It's empty now.)")
        else
            cutscene:text("* (You would like some Cake but\nyou'd rather not alert Axis.)")
            local outcome = cutscene:textChoicer("* (Risk it?)\n", {"Yes", "    No"})
            if outcome == 1 then
                Game.world.music:fade(0, 10/30)
                Assets.playSound("chem_cake_take")
                cutscene:wait(3.5)
                Game.world.map:getEvent("stw_cake"):setSprite("world/events/steamworks/chem_03_cake_2")
                Game.inventory:addItem("uty_items/cake")
                Game:setFlag("chem_got_cake", true)
                Game.world.music:fade(1, 10/30)
                cutscene:text("* (...Phew.)")
            else
                cutscene:text("* (Better safe than sorry.)")
            end
        end
    end
}
