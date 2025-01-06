return function(cutscene)
    if Game.world.map.id == "steamworks/01" then
        if Game.world:getCharacter("susie_lw") then
            cutscene:showNametag("Susie")
            cutscene:text("* Dang,[wait:5] this place is kinda...[wait:10] creepy.", "nervous_side", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/06" then
        if Game.world:getCharacter("susie_lw") then
            cutscene:showNametag("Susie")
            cutscene:text("* Woah,[wait:5] it's kinda hot in here...", "surprise", "susie")
            cutscene:text("* Also,[wait:5] what is this pink goo...?", "suspicious", "susie")
            if Game.world:getCharacter("jamm_lw") or cutscene:getCharacter("jammarcy_light") then
                cutscene:showNametag("Jamm")
                cutscene:text("* Maybe the coolant?", "look_left", "jamm")
                cutscene:text("* Anything complex has to cool down somehow...", "look_left", "jamm")
            end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/06b" then
        if Game.world:getCharacter("noel") then
            if Game:getFlag("talk_06b_noel") ~= 1 then
                cutscene:showNametag("Noel")
                cutscene:text("* ... Steamworks...[wait:5] Just steamworks...", "neutral", "noel")
                cutscene:text("* Asgore named this place,[wait:5] that's obvious...", "bruh", "noel")
                cutscene:text("* The thing I want to know is who bulit the big dumb sign that just says STEAMWORKS.", "...", "noel")
                cutscene:text("* I mean,[wait:5] you don't see me wear a nametag that just says Noel.", "bruh", "noel", {auto = true})
                cutscene:showNametag("That would be absurd and ridiculous.")
                cutscene:text("[instant]* I mean, you don't see me wear a nametag that just says Noel.", "bruh", "noel")
                cutscene:hideNametag()
                Game:setFlag("talk_06b_noel", 1)
            else
                cutscene:text("* What?", "neutral", "noel")
            end
        end
    elseif Game.world.map.id == "steamworks/09" then
        if Game.world:getCharacter("susie_lw") then
            cutscene:showNametag("Susie")
            cutscene:text("* Dang,[wait:5] we're kinda high up...", "nervous_side", "susie")
            if Game.world:getCharacter("jamm_lw") or cutscene:getCharacter("jammarcy_light") then
                cutscene:showNametag("Jamm")
                cutscene:text("* Then I hope nobody here is scared of heights.", "look_left", "jamm")
				if cutscene:getCharacter("jammarcy_light") then
					cutscene:text("* (Don't look down, Marcy...)", "nervous_left", "jamm")
				end
            end
            cutscene:hideNametag()
        end
    else
        cutscene:text("* Your voice echoes aimlessly.")
    end
end

