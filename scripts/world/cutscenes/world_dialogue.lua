return function(cutscene)
    local susie = Game.world:getCharacter("susie_lw")
    local jamm = Game.world:getCharacter("jamm_lw")
    local jammarcy = cutscene:getCharacter("jammarcy_light")
    if Game.world.map.id == "steamworks/01" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Dang,[wait:5] this place is kinda...[wait:10] creepy.", "nervous_side", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/06" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Woah,[wait:5] it's kinda hot in here...", "surprise", "susie")
            cutscene:text("* Also,[wait:5] what is this pink goo...?", "suspicious", "susie")
            if jamm or jammarcy then
                cutscene:showNametag("Jamm")
                cutscene:text("* Maybe the coolant?", "look_left", "jamm")
                cutscene:text("* Anything complex has to cool down somehow...", "look_left", "jamm")
            end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/06b" then
        if Game.world:getCharacter("noel") then
            if Game:getFlag("talk_stw_06b_noel") ~= 1 then
                cutscene:showNametag("Noel")
                cutscene:text("* ... Steamworks...[wait:5] Just steamworks...", "neutral", "noel")
                cutscene:text("* Asgore named this place,[wait:5] that's obvious...", "bruh", "noel")
                cutscene:text("* The thing I want to know is who bulit the big dumb sign that just says STEAMWORKS.", "...", "noel")
                cutscene:text("* I mean,[wait:5] you don't see me wear a nametag that just says Noel.", "bruh", "noel", {auto = true})
                cutscene:showNametag("That would be absurd and ridiculous.")
                cutscene:text("[instant]* I mean, you don't see me wear a nametag that just says Noel.", "bruh", "noel")
                cutscene:hideNametag()
                Game:setFlag("talk_stw_06b_noel", 1)
            else
                cutscene:text("* What?", "neutral", "noel")
            end
        end
    elseif Game.world.map.id == "steamworks/09" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Dang,[wait:5] we're kinda high up...", "nervous_side", "susie")
            if jamm or jammarcy then
                cutscene:showNametag("Jamm")
                cutscene:text("* Then I hope nobody here is scared of heights.", "look_left", "jamm")
				if jammarcy then
					cutscene:text("* (Don't look down, Marcy...)", "nervous_left", "jamm")
				end
            end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/27" then
        if susie then
            cutscene:showNametag("Susie")
            if Game:getFlag("talk_stw_27_susie") ~= 1 then
                cutscene:text("* WOAH.[wait:5] That's a lot of white...", "surprise", "susie")
                cutscene:text("* Those plants seem to be everywhere around here...", "nervous_side", "susie")
                cutscene:text("* I wonder if they taste like moss.", "small_smile", "susie")
                Game:setFlag("talk_stw_27_susie", 1)
            else
                cutscene:text("* Maybe I should try some of them...", "smirk", "susie")
            end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/28" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* What happened to those bots lying all over the place?", "suspicious", "susie")
            cutscene:text("* Did they just suddenly turned off and were left here?", "suspicious", "susie")
            cutscene:text("* Why would anybody just leave those things lying around?", "suspicious", "susie")
            cutscene:text("* That's just weird.", "annoyed", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/29" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* There's so much of those stupid glowing plants here.", "suspicious", "susie")
            cutscene:text("* Can we hurry up?[wait:5] My eyes are starting to hurt.", "annoyed", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/36" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Seems like we're approaching the end of this place.", "neutral_side", "susie")
            cutscene:text("* About time.[wait:5] I was starting to get tired of it.", "annoyed", "susie")
            if jamm or jammarcy then
                cutscene:showNametag("Jamm")
                cutscene:text("* Same.", "look_left", "jamm")
            end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/37" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Looks like this is it.", "neutral", "susie")
            cutscene:text("* Hopefully that elevator will take us out of here.", "neutral_side", "susie")
            cutscene:text("* Let's get moving.", "annoyed", "susie")
            cutscene:hideNametag()
        end
    else
        cutscene:text("* Your voice echoes aimlessly.")
    end
end

