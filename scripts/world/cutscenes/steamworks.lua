return {
    axis_meeting = function(cutscene, event)
        local axis = cutscene:getCharacter("axis")
        Assets.playSound("alert")
        axis:setAnimation("left")
        cutscene:wait(1)
        cutscene:text("* HALT.", "normal", "axis")
        cutscene:text("* OH WAIT YOU CAN GO BEACUSE THAT CUTSCENE IS NOT DONE.", "normal", "axis")
        Game:setFlag("axis_met", true)
    end,
    axis_meeting_alt = function(cutscene, event)
        cutscene:text("* STOP RIGHT THERE.", nil, "axis")
        Game.world:spawnNPC("axis", 820, 320)
        local axis = cutscene:getCharacter("axis")
        axis:setAnimation("left")
        cutscene:wait(cutscene:slideTo(axis, axis.x-140, axis.y, 0.5))
        cutscene:text("* OH WAIT YOU CAN GO BEACUSE THAT CUTSCENE IS NOT DONE.", "normal", "axis")
        Game:setFlag("axis_met", true)
    end,
    axis_second_meeting = function(cutscene, event)
        local leader = Game.world.player
        local axis = cutscene:getCharacter("axis")
        local trapdoor = Game.world.map:getEvent("stw_trapdoor")

        Game.world.music:stop()
        cutscene:detachFollowers()

        cutscene:walkTo(leader, event.x + event.width, event.y + event.height/2, 0.5, "left")
        cutscene:walkTo(cutscene:getCharacter(Game.party[2].id), event.x + event.width + 30, event.y + event.height/2, 0.5, "left")
        if Game.party[3] then
            cutscene:walkTo(cutscene:getCharacter(Game.party[3].id), event.x + event.width + 60, event.y + event.height/2, 0.5, "left")
        end
        if Game.party[4] then
            cutscene:walkTo(cutscene:getCharacter(Game.party[4].id), event.x + event.width + 90, event.y + event.height/2, 0.5, "left")
        end

        cutscene:wait(1)
        cutscene:detachCamera()
        cutscene:panTo(Game.world.camera.x - 150, Game.world.camera.y)
        cutscene:wait(1.5)
		Assets.playSound("spearappear", 2)
        axis.alpha = 1
        cutscene:wait(0.5)

        cutscene:wait(1)
        cutscene:wait(cutscene:slideTo(axis, axis.x, leader.y, 0.2))
        cutscene:wait(0.1)
        cutscene:setAnimation(axis, "right")
        cutscene:wait(cutscene:slideTo(axis, axis.x + 100, leader.y, 0.2))
        Game.world.music:play("enter_axis")
        cutscene:showNametag("Axis")
        cutscene:text("* FOUND YOU.", "normal", "axis")
        if cutscene:getCharacter("susie") then
            cutscene:showNametag("Susie")
            cutscene:text("* The hell do you need from us?!", "angry", "susie")
            cutscene:text("* Just piss off,[wait:5] dude.", "annoyed", "susie")
            cutscene:showNametag("Axis")
        end
        cutscene:text("* YOUR CRIMES ARE AS\nFOLLOWS:", "normal", "axis")
        cutscene:text("* - TRESPASSING ON\nPRIVATE PROPERTY.", "normal", "axis")
        cutscene:text("* - RESISTING ARREST.", "normal", "axis")
        if cutscene:getCharacter("kris") or cutscene:getCharacter("hero") or cutscene:getCharacter("jamm") then
            cutscene:text("* - HUMAN.", "normal", "axis")
            if cutscene:getCharacter("jamm") then
                cutscene:showNametag("Jamm")
                cutscene:text("* Since when is being a human a crime?", "determined", "jamm")
                cutscene:showNametag("Axis")
                cutscene:text("[color:FF00FF]* ACCESSING MEMORY BANK_", nil, "axis")
                cutscene:hideNametag()
                cutscene:wait(1)
                cutscene:showNametag("Axis")
                cutscene:text("[color:FF00FF]* MEMORY BANK BLOCKED_", nil, "axis")
                cutscene:text("* SORRY,[wait:5] BUT I AM UNABLE TO PROVIDE THE EXACT DATE.", "normal", "axis")
                cutscene:showNametag("Jamm")
                cutscene:text("* That was a rethorical question.", "nervous_left", "jamm")
                cutscene:showNametag("Axis")
                cutscene:text("* . . .", "normal", "axis")
                cutscene:text("* ANYWAYS.", "normal", "axis")
            end
        end
        if Game:getFlag("dessimation") then -- idk WIP
            cutscene:text("* DESSIMATION LINE OR WHATEVER.", "normal", "axis")
        else
            cutscene:showNametag("Axis")
            local opinion = cutscene:textChoicer("* HOW TO YOU PLEAD TO\nTHESE ACCUSATIONS?", {"Not guilty", "Guilty"}, "normal", "axis")
            if opinion == 1 then
                cutscene:text("* PLAYING TOUGH ARE WE?", "normal", "axis")
                cutscene:text("* THAT IS NO MATTER.", "normal", "axis")
                cutscene:text("* I WILL SCAN YOUR FACE\nWITH MY LIE DETECTOR.", "normal", "axis")
                cutscene:hideNametag()
                cutscene:wait(3)
                cutscene:showNametag("Axis")
                cutscene:text("* INCREDIBLE.", "normal", "axis")
                cutscene:text("* YOU HAVE THE MOST\nEMOTIONLESS FACE I HAVE\nEVER SEEN.", "normal", "axis")
                cutscene:text("* I WILL JUST HAVE TO GO\nWITH MY NON-EXISTENT GUT\nAND SAY YOU WERE LYING.", "normal", "axis")
            elseif opinion == 2 then
                if cutscene:getCharacter("susie") then
                    cutscene:showNametag("Susie")
                    --cutscene:getCharacter("susie"):setSprite("exasperated_left")
                    cutscene:text("* (WHY'D YOU SAY THAT!?)", "teeth", "susie")
                    cutscene:showNametag("Axis")
                end
                cutscene:text("* REALLY?", "normal", "axis")
                cutscene:text("* THAT WAS EASY.", "normal", "axis")
                cutscene:text("* YOUR CRIMES WILL BE\nREPORTED TO AN\nAUTHORITY.", "normal", "axis")
                cutscene:text("* OH WAIT,[wait:5] THAT IS ME.", "normal", "axis")
            end
            cutscene:text("* ENJOY YOUR ISOLATION,[wait:5]\nHUMAN.", "normal", "axis")
            cutscene:hideNametag()

            Game.world.music:stop()
            trapdoor:setSprite("world/maps/steamworks/small_objects/12_trapdoor", 1/10)
            cutscene:wait(0.5)
            Assets.playSound("trapdoor_open")
            cutscene:wait(1.1)
            trapdoor:setSprite("world/maps/steamworks/small_objects/12_trapdoor_16")

            for _,member in ipairs(Game.party) do
                local chara = Game.world:getCharacter(member.id)
                if chara then
                    chara.sprite:setFacing("down")
                end
            end

            cutscene:wait(0.1)
            cutscene:attachCamera()
            cutscene:wait(1)
            if cutscene:getCharacter("noel") then
                Assets.playSound("wing")
                cutscene:getCharacter("noel"):setSprite("brella")
                cutscene:wait(0.5)
            end
            Game.world.camera.keep_in_bounds = false
            Assets.playSound("fall_trapdoor")

            if cutscene:getCharacter("susie") then
                cutscene:getCharacter("susie"):setSprite("fall")
                Assets.playSound("sussurprise")
            end

            for _,member in ipairs(Game.party) do
                local chara = Game.world:getCharacter(member.id)
                if chara then
                    chara.alpha = 0.75
                    if member.id == "noel" then
                        cutscene:slideTo(chara, chara.x, chara.y + 400, 1)
                    else
                        cutscene:slideTo(chara, chara.x, chara.y + 800, 1)
                    end
                end
            end
            cutscene:wait(2)
            cutscene:detachCamera()
            for _,member in ipairs(Game.party) do
                local chara = Game.world:getCharacter(member.id)
                if chara then
                    if member.id ~= "noel" then
                        cutscene:slideTo(chara, chara.x, chara.y + 800, 1)
                    end
                end
            end
            cutscene:mapTransition("steamworks/13")
            Game:setFlag("basement_trapped", true)
        end
        Game:setFlag("axis_second_met", true)
    end,
    basement_door = function(cutscene, event)
        if Game:getFlag("basement_trapped") and Game:getFlag("axis_basement_caught") == 2 then
            cutscene:text("* (The door is locked.)")
        else
            Game.world:mapTransition("steamworks/13b")
        end
    end,
    basement_axis = function(cutscene, event)
        local axis = cutscene:getCharacter("axis")
        cutscene:wait(cutscene:walkTo(axis, axis.x, event.y - 80, 0.5, "down"))

        cutscene:showNametag("Axis")
        if Game:getFlag("axis_basement_caught") ~= 1 then
            cutscene:text("* I CANNOT BELIEVE YOU\nFELL FOR THAT.", "normal", "axis")
            cutscene:text("* I AM SMART, THEREFORE I\nPREDICTED YOUR ESCAPE.", "normal", "axis")
            cutscene:text("* NOW,[wait:5] BACK YOU GO.", "normal", "axis")
            Game:setFlag("axis_basement_caught", 1)
        else
            cutscene:text("* WHAT.[wait:5] WHY.", "normal", "axis")
            cutscene:text("* DID YOU THINK I WOULD\nJUST LEAVE AFTER ONE\nATTEMPT?", "normal", "axis")
            cutscene:text("* ... I WAS ABOUT TO,[wait:5]\nACTUALLY.[wait:5] THAT WAS\nCLOSE.", "normal", "axis")
            cutscene:text("* I WILL LOCK THE DOOR\nFROM NOW ON.", "normal", "axis")
            cutscene:text("* BYE NOW.", "normal", "axis")
            Game:setFlag("axis_basement_caught", 2)
        end
        cutscene:hideNametag()
        
        cutscene:walkTo(axis, axis.x, axis.y + 200, 2, "down")
        Game.world:mapTransition("steamworks/13", "door")
    end,
    vent = function(cutscene, event)
        cutscene:text("* A slightly open vent.")
        local opinion = cutscene:textChoicer("* Go inside?\n", {"Yes", "    No"})
        if opinion == 1 then
            Game.world:mapTransition("steamworks/13", "vent")
        end
    end,
    basement_out = function(cutscene, event) -- WIP
        cutscene:wait(1)
        --[[cutscene:showNametag("Hero")
        cutscene:text("* Finally we're out.", nil, "hero")
        cutscene:hideNametag()
        cutscene:wait(1)]]
    end,
    grandfather_clock = function(cutscene, event)
        if not Game:getFlag("grandfather_clock_talk") then
            cutscene:showNametag("Clock")
            cutscene:text("* Tick-tock - tick-tock -\ntick-tock...", nil, event)
            cutscene:text("* The current time is 6:26,\nMonday morning!", nil, event)
            cutscene:text("* You may have noticed the\napple trees outside the\nSteamworks are blooming.", nil, event)
            cutscene:text("* That means Spring is upon us!", nil, event)
            cutscene:text("* This time of year, my creator\nrecommends a picnic by the\nriver just south of here!", nil, event)
            cutscene:hideNametag()
            Game:setFlag("grandfather_clock_talk", 1)
        elseif Game:getFlag("grandfather_clock_talk") == 1 then
            cutscene:showNametag("Clock")
            cutscene:text("* Why the puzzled look? Have we\nnot met before?", nil, event)
            cutscene:showNametag("Grandfather Clock")
            cutscene:text("* I am the Grandfather Clock of\nthe Underground!", nil, event)
            cutscene:text("* It is my responsibility to\nkeep the standard time for all\nmonsters.", nil, event)
            cutscene:text("* However, I cannot help but\nfeel there is a miscalculation\nin my tick-tocking.", nil, event)
            cutscene:text("* It is simply driving me mad!", nil, event)
            cutscene:hideNametag()
            Game:setFlag("grandfather_clock_talk", 2)
        elseif Game:getFlag("grandfather_clock_talk") == 2 then
            cutscene:showNametag("Grandfather Clock")
            cutscene:text("* I do not sense the gears\nturning within these walls.", nil, event)
            cutscene:text("* Hm, yes, I believe the main\nclock face outside has stalled!", nil, event)
            cutscene:text("* An engineer should arrive to\nfix it soon.", nil, event)
            cutscene:text("* Do not worry, I will continue\nto keep the time!", nil, event)
            cutscene:hideNametag()
            Game:setFlag("grandfather_clock_talk", 3)
        elseif Game:getFlag("grandfather_clock_talk") == 3 then
            cutscene:showNametag("Grandfather Clock")
            cutscene:text("* Tick-tock - tick-tock -\ntick-tock...", nil, event)
            cutscene:hideNametag()
        end
    end,
    note_17 = function(cutscene, event)
        if Game:getFlag("note_17") == 1 then
            Game:setFlag("note_17", 0)
            cutscene:text("* (The paper underneath reads:)	")
            cutscene:text("* Project:[wait:5] Metal & Magic:	")
            cutscene:text("* Effective immediately,[wait:5] cease\nhome utility production at the\nFactory-	")
            cutscene:text("* (The rest of the page is\nredacted.)")
        else
            Game:setFlag("note_17", 1)
            cutscene:text("* (The topmost paper is a\nhandwritten letter.)	")
            cutscene:text("* To:[wait:5] King ASGORE.	")
            cutscene:text("* This project,[wait:5] while exciting,[wait:5]\nwill be quite the undertaking.	")
            cutscene:text("* We will need Mining Co. to\nwork overtime to provide the\nnecessary materials.	")
            cutscene:text("* Furthermore, a meeting was\nconducted at the Factory.	")
            cutscene:text("* I'm happy to report that\neveryone is on board!	")
            cutscene:text("* There already are many great\nrobot ideas floating about.	")
            cutscene:text("* Cooking,[wait:5] cleaning,[wait:5] recreation;[wait:5]\nthe motivation is through the\nroof!	")
            cutscene:text("* Though...[wait:5] one engineer\nsuggested we take this further\nwith a \"protection bot.\"	")
            cutscene:text("* I am quite unsure about that\nproposition but you have the\nfinal say.	")
            cutscene:text("* In any case,[wait:5] we will see this\ncompleted.	")
            cutscene:text("* - Prof. Z.")
        end
    end,
    boba_npc = function(cutscene, event)
        if not Game:getFlag("boba_npc_talk") then
            cutscene:showNametag("Robot")
            cutscene:text("* (Slurp slurrrrp)", nil, event)
            cutscene:text("* Ahhhh!", nil, event)
            cutscene:text("* Nothing like Steamworks\nBoba-Soup (TM) to fuel the\nengine!", nil, event)
            cutscene:text("* What? Don't act like you've\nnever heard of it.", nil, event)
            cutscene:hideNametag()
            Game:setFlag("boba_npc_talk", 1)
        elseif Game:getFlag("boba_npc_talk") == 1 then
            cutscene:showNametag("Robot")
            cutscene:text("* Did you know that humans also\nrun on a liquid? It's called\n\"blood.\"", nil, event)
            cutscene:text("* Apparently it doesn't taste\nany good, which is like, a\ntotal shame.", nil, event)
            cutscene:hideNametag()
            Game:setFlag("boba_npc_talk", 2)
        elseif Game:getFlag("boba_npc_talk") == 2 then
            cutscene:showNametag("Robot")
            cutscene:text("* I'd let you try this stuff but\nit's total poison to\nnon-robots.", nil, event)
            cutscene:text("* How do I know that? I don't.", nil, event)
            cutscene:text("* I just wanna deter you from\ndraining my sweet sweet lake.", nil, event)
            cutscene:hideNametag()
            Game:setFlag("boba_npc_talk", 3)
        elseif Game:getFlag("boba_npc_talk") == 3 then
            cutscene:showNametag("Robot")
            cutscene:text("* (Slurp slurrrp)", nil, event)
            cutscene:hideNametag()
        end
    end,
    burned_stand = function(cutscene, event) -- no Roba gotta change that
        --[[cutscene:showNametag("Ceroba")
        cutscene:text("* Oh,[wait:5] yeah,[wait:5] this...[wait:10] Thing.", "alt", "ceroba")
        cutscene:text("* It's WIP.", "irked", "ceroba")
        cutscene:hideNametag()]]
    end,
    vendy_shop = function(cutscene, event)
        Game.world:lightShopTransition("vendy")
    end,
    room_06 = function(cutscene, event) -- you're not???
        if Game:getFlag(noel_party) == true then
            cutscene:text("* Oh, I'm pink now.", "neutral", "noel")
        end
    end
}
