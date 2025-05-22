return {
    newhome = function(cutscene, event)
        local ceroba = cutscene:getCharacter("ceroba")
        local playerLV = Game.party[1]:getLightLV()
        local playerEXP = Game.party[1]:getLightEXP()
        local STWKills = Game:getFlag("steamworks_kills") -- kills that don't give EXP
        ceroba:facePlayer()
        if not Game.world.map:getFlag("ceroba_talk") then
            cutscene:text("* ...", "dissapproving_1", "ceroba")
            cutscene:text("* Oh...", "alt", "ceroba")
            if playerLV == 1 then
                cutscene:text("* Hello there.", "neutral", "ceroba")
            else
                cutscene:text("* Hey there.", "muttering", "ceroba")
            end
            cutscene:text("* I suppose we weren't really properly introduced.", "alt", "ceroba")
            cutscene:text("* My name is [color:ed8c24]Ceroba[color:reset].", "alt", "ceroba")
            Game.world.map:setFlag("ceroba_talk", 1)
        elseif Game.world.map:getFlag("ceroba_talk") == 1 then
            cutscene:text("* What more do I have to say?", "dissapproving", "ceroba")
            cutscene:text("* This place is really special to me.", "closed_eyes", "ceroba")
            if Game:getFlag("axis_dead") or playerLV > 10 then
                cutscene:text("* ...", "dissapproving_1", "ceroba")
                cutscene:text("* Ugh,[wait:5] not like you care anyway.", "irked", "ceroba")
                if Game:getFlag("axis_dead") then
                    cutscene:text("* You destroyed my husband's legacy.", "angry_alt", "ceroba")
                    cutscene:text("* His last and best creation.", "angry_alt", "ceroba")
                    cutscene:text("* I don't care if you didn't knew that.", "dissapproving", "ceroba")
                    cutscene:text("* \"Not knowing\"...", "irked", "ceroba")
                    cutscene:text("* Does not absolve you from responsibility for your actions!", "angry_alt", "ceroba")
                else
                    cutscene:text("* I can see it,[wait:5] you know.", "irked", "ceroba")
                    cutscene:text("* Dozens are slain by you...", "angry", "ceroba")
                    cutscene:text("* You destroy lives of other people,[wait:5] not caring about them even sligtly.", "angry_alt", "ceroba")
                    cutscene:text("* I despise you.", "irked", "ceroba")
                end
            else
                cutscene:text("* It serves as a memory...[wait:5] Of a special someone.", "dissapproving", "ceroba")
                cutscene:text("* Someone who...[wait:5] Didn't deserve the fate they had.", "mourning", "ceroba")
                cutscene:text("* They deserved better.", "sorrowful", "ceroba")
                cutscene:text("* ...", "sorrowful", "ceroba")
            end
            Game.world.map:setFlag("ceroba_talk", 2)
        elseif Game.world.map:getFlag("ceroba_talk") == 2 then
            if Game:getFlag("axis_dead") or playerLV > 10 then
                cutscene:text("* If you still don't get it...", "irked", "ceroba")
                cutscene:text("* I don't wish to speak to you.", "angry_alt", "ceroba")
                cutscene:text("* So get.[wait:10] Lost.", "sorrowful", "ceroba")
                cutscene:text("* Before things are gonna get worse for you.", "deathstare", "ceroba")
            else
                cutscene:text("* ...", "neutral_1", "ceroba")
                cutscene:text("* Say...", "alt", "ceroba")
            end
            Game.world.map:setFlag("ceroba_talk", 3)
        else
            if Game:getFlag("axis_dead") or playerLV > 10 then
                cutscene:text("* Begone.", "sorrowful", "ceroba")
            else
                cutscene:text("* Don't forget:[wait:5] [color:yellow]Dunes,[wait:5] Oasis Valley,[wait:5] head up from there.", "neutral", "ceroba")
                cutscene:text("* [color:yellow]Cross the gate[color:reset],[wait:5] and I shall wait you there.", "neutral", "ceroba")
            end
        end
        ceroba:setFacing("up")
    end
}
