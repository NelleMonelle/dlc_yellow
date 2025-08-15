return function(cutscene)
    local susie = Game.world:getCharacter("susie_lw")
    local noelle = Game.world:getCharacter("noelle_lw")
    local ceroba = Game.world:getCharacter("ceroba")
    local jamm = Game.world:getCharacter("jamm_lw")
    local jammarcy = cutscene:getCharacter("jammarcy_light")
    if Game.world.map.id == "dunes/mansion/chujins_grave" then
        if ceroba then
            cutscene:showNametag("Ceroba")
            cutscene:text("* [speed:0.1]...", "mourning", "ceroba")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/01" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Dang,[wait:5] this place is kinda...[wait:10] creepy.", "nervous_side", "susie")
            if noelle then
                cutscene:showNametag("Noelle")
                cutscene:text("* I agree...", "what_smile", "noelle")
            end
            if jammarcy then
                cutscene:showNametag("Marcy")
                cutscene:text("* Marcy is scared,[wait:5] papa...", "disturbed", "marcy")
                cutscene:showNametag("Jamm")
                cutscene:text("* Don't worry,[wait:5] Marcy.[wait:10]\n* We'll get through this.", "look_left", "jamm")
            end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/06" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Woah,[wait:5] it's kinda hot in here...", "surprise", "susie")
            if noelle then
                cutscene:showNametag("Noelle")
                cutscene:text("* Totally.", "frown", "noelle")
                cutscene:text("* I don't think I've felt heat like that...", "confused_surprise_b", "noelle")
                cutscene:text("* Ever.", "confused_surprise", "noelle")
                cutscene:showNametag("Susie")
            end
            cutscene:text("* Also,[wait:5] what is this pink goo...?", "suspicious", "susie")
            if (jamm and not Game:getFlag("dungeonkiller")) or jammarcy then
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
            if (jamm and not Game:getFlag("dungeonkiller")) or jammarcy then
                cutscene:showNametag("Jamm")
                cutscene:text("* Then I hope nobody here is scared of heights.", "look_left", "jamm")
                if noelle then
                    cutscene:showNametag("Noelle")
                    cutscene:text("* ...", "what_smile", "noelle")
                end
				if jammarcy then
					cutscene:text("* (Don't look down,[wait:5] Marcy...)", "nervous_left", "jamm")
				end
            end
            cutscene:hideNametag()
        elseif noelle then
            cutscene:showNametag("Noelle")
            cutscene:text("* It's really...[wait:10] High in here,[wait:5] haha...", "what_smile", "noelle")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/27" then
        if susie then
            cutscene:showNametag("Susie")
            if Game:getFlag("talk_stw_27_susie") ~= 1 then
                cutscene:text("* WOAH.[wait:5] That's a lot of white...", "surprise", "susie")
                cutscene:text("* Those plants seem to be everywhere around here...", "nervous_side", "susie")
                cutscene:text("* I wonder if they taste like moss.", "small_smile", "susie")
                if noelle then
                    cutscene:showNametag("Noelle")
                    cutscene:text("* I wonder if they're even edible.", "frown", "noelle")
                end
                Game:setFlag("talk_stw_27_susie", 1)
            else
                cutscene:text("* Maybe I should try some of them...", "smirk", "susie")
                if noelle then
                    cutscene:showNametag("Noelle")
                    cutscene:text("* (You shouldn't!!)", "smile_closed_b", "noelle")
                end
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
			if (jamm and not Game:getFlag("dungeonkiller")) or jammarcy then
                cutscene:showNametag("Jamm")
                cutscene:text("* You have to keep in mind this place is abandoned.", "neutral", "jamm")
                cutscene:text("* Can't imagine the bots can self-sustain for...[wait:5] How long now?", "nervous_left", "jamm")
			end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/29" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* There's so much of those stupid glowing plants here.", "suspicious", "susie")
            cutscene:text("* Can we hurry up?[wait:5] My eyes are starting to hurt.", "annoyed", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/35" then
        if not Game:getFlag("axis_done") then
            if susie then
                cutscene:showNametag("Susie")
                cutscene:text("* Is that Axis over there?", "surprise_frown", "susie")
                cutscene:text("* You better keep your guard up.", "annoyed", "susie")
                cutscene:hideNametag()
            end
        else
            if Game:getFlag("axis_dead") then
                if susie then
                    cutscene:showNametag("Susie")
                    cutscene:text("* We should...[wait:10] Get moving.", "shy_down", "susie")
                    cutscene:hideNametag()
                end
            else
                if susie then
                    cutscene:showNametag("Susie")
                    cutscene:text("* That was one hell of a battle.", "smile", "susie")
                    cutscene:text("* Though,[wait:5] I think we better get moving.", "smirk", "susie")
                    cutscene:hideNametag()
                end
            end
        end
    elseif Game.world.map.id == "steamworks/36" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Seems like we're approaching the end of this place.", "neutral_side", "susie")
            cutscene:text("* About time.[wait:5] I was starting to get tired of it.", "annoyed", "susie")
            if noelle then
                cutscene:showNametag("Noelle")
                cutscene:text("* I gotta admit...", "confused_surprise_b", "noelle")
                cutscene:text("* That place really tired me out, haha...", "what_smile", "noelle")
            end
            if (jamm and not Game:getFlag("dungeonkiller")) or jammarcy then
                cutscene:showNametag("Jamm")
                cutscene:text("* Can't believe I'm saying this,[wait:5] but...[wait:5] Same.", "stern", "jamm")
            end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "steamworks/37" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Looks like this is it.", "neutral", "susie")
            cutscene:text("* Hopefully that elevator will take us out of here.", "neutral_side", "susie")
            cutscene:text("* Let's get moving.", "annoyed", "susie")
			if jammarcy then
				cutscene:showNametag("Marcy")
                cutscene:text("* Marcy agrees...[wait:10]\n* It's creepy in there.", "disturbed", "marcy")
			end
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "newhome/01" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Looks like this is it.", "neutral", "susie")
            cutscene:text("* Hopefully that elevator will take us out of here.", "neutral_side", "susie")
            cutscene:text("* Let's get moving.", "annoyed", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "newhome/02" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Looks like this is it.", "neutral", "susie")
            cutscene:text("* Hopefully that elevator will take us out of here.", "neutral_side", "susie")
            cutscene:text("* Let's get moving.", "annoyed", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "newhome/02b" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Looks like this is it.", "neutral", "susie")
            cutscene:text("* Hopefully that elevator will take us out of here.", "neutral_side", "susie")
            cutscene:text("* Let's get moving.", "annoyed", "susie")
            cutscene:hideNametag()
        end
    elseif Game.world.map.id == "newhome/03" then
        if susie then
            cutscene:showNametag("Susie")
            cutscene:text("* Looks like this is it.", "neutral", "susie")
            cutscene:text("* Hopefully that elevator will take us out of here.", "neutral_side", "susie")
            cutscene:text("* Let's get moving.", "annoyed", "susie")
            cutscene:hideNametag()
        end
    else
        if #Game.party > 1 then
            if susie then
                cutscene:text("* [speed:0.1]...", "neutral_side", "susie")
            end
            if noelle then
                cutscene:text("* [speed:0.1]...", "frown", "noelle")
            end
            if ceroba then
                cutscene:text("* [speed:0.1]...", "alt_1", "ceroba")
            end
            if jamm or jammarcy then
                if Game:getFlag("dungeonkiller") then
                    cutscene:text("* [speed:0.1]...", "shaded_neutral", "jamm")
                else
                    cutscene:text("* I think we should get going.", "look_left", "jamm")
                end
            end
        else
            cutscene:text("* Your voice echoes aimlessly.")
        end
    end
end

