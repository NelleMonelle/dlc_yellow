return function(cutscene)
    if Game.world.map.id == "steamworks/01" then
        if Game.world:getCharacter("susie") then
            cutscene:showNametag("Susie")
            cutscene:text("* Dang,[wait:5] this place is kinda...[wait:10] creepy.", "nervous_side", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/06" then
        if Game.world:getCharacter("susie") then
            cutscene:showNametag("Susie")
            cutscene:text("* Dang,[wait:5] this place is kinda...[wait:10] creepy.", "nervous_side", "susie")
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
    else
        cutscene:text("* Your voice echoes aimlessly.")
    end
end

