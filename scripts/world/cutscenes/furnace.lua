return function(cutscene)
    ---@param cutscene WorldCutscene
    local axis = cutscene:getCharacter("axis")

    if Game:getFlag("axis_hurt") and not Game:getFlag("EMPTIED_STEAMWORKS") then
        Assets.playSound("ominous_cancel")
    end
    cutscene:walkTo(Game.world.player, axis.x, Game.world.player.y, 1, "up")
    cutscene:wait(2.25)

    if Game:getFlag("axis_hurt") then
        cutscene:showNametag("Axis")
        if Game:getFlag("EMPTIED_STEAMWORKS") then
            cutscene:text("* I. ..", "damaged", "axis")
            cutscene:text("* I DID ALL I C0ULD.", "damaged", "axis")
            cutscene:text("* I wAS OnLY ABLE TO sAVE\nA FEW buT...", "damaged", "axis")
            cutscene:text("* NoW_ I KN0W YOU WILL\nLE4VE ThIS PLaCE\nUNSATISFIED.", "damaged", "axis")
            cutscene:text("* . . .", "damaged", "axis")
            cutscene:text("* TH3 SAME FaTE ThEY mET\nMAY AWAiT ME,", "damaged", "axis")
            cutscene:text("* BuT I WILL N0 LONG,ER\nRUN FRom YOU.", "damaged", "axis")
            cutscene:text("* ThAT CANN0N OF DE4TH\nYOU WIeLD iS STR0NG.. .", "damaged", "axis")

            cutscene:text("* BUT AS you CAN SEE, . .", "damaged", "axis")
            cutscene:text("* I H4VE DRaWN A \"WEAP0n\"\nOF MY OWN_.", "damaged", "axis")
            cutscene:text("* NoW.. . AS THE K1DS\nSAY,", "damaged", "axis")
            cutscene:text("* COME AT ME.", "damaged", "axis")
        else
            cutscene:text("* CoULDN'T GET us ALL,\nHUH?", "damaged", "axis")
            cutscene:text("* IT SE3MS MaNY BOTS\nEvADED Y0U.", "damaged", "axis")
            cutscene:text("* NoW_ I KN0W YOU WILL\nLE4VE ThIS PLaCE\nUNSATISFIED.", "damaged", "axis")
            cutscene:text("* BUT AS yOU CAN SEE, I\nAM STILL H3RE.", "damaged", "axis")
            cutscene:text("* WeLL, ,,", "damaged", "axis")
            cutscene:text("* I DECIdED I WILL N0\nLONG,ER RUN FRom YOU.", "damaged", "axis")
            cutscene:text("* ThAT CANN0N OF DE4TH\nYOU WIeLD iS STR0NG.. .", "damaged", "axis")

            cutscene:text("* BUT I H4VE DRaWN A\n\"WEAP0n\" OF MY OWN_.", "damaged", "axis")
            cutscene:text("* SO. ..", "damaged", "axis")
            cutscene:text("* WhY NOT TRY Y0UR LUCK?", "damaged", "axis")
        end
        cutscene:hideNametag()
        cutscene:startLightEncounter("axis_genocide")

        if Game:getFlag("EMPTIED_STEAMWORKS") then
            axis:setAnimation("damaged_down")
            Game:rollShiny("ceroba")
            Game.world:spawnNPC("ceroba", axis.x, axis.y + 40)
            local ceroba = cutscene:getCharacter("ceroba")
            cutscene:wait(1)
            cutscene:text("* Axis.", "sorrowful", "ceroba")
            cutscene:text("* Get out of here.[wait:5] This is an order.", "sorrowful", "ceroba")
            cutscene:wait(1)
            cutscene:text("* . . .", "damaged", "axis")
            cutscene:wait(1)
            axis:setAnimation("damaged_right")
            cutscene:wait(cutscene:slideTo(axis, 1521, axis.y, 1))
            cutscene:wait(0.5)
            axis:setAnimation("damaged_down")
            cutscene:wait(cutscene:slideTo(axis, axis.x, Game.world.player.y, 1))
            axis:setAnimation("damaged_right")
            cutscene:wait(0.5)
            axis:setAnimation("damaged_left")
            cutscene:text("* . . .", "damaged", "axis")
            axis:setAnimation("damaged_right")
            cutscene:wait(cutscene:slideTo(axis, 1761, axis.y, 0.8))
            axis:remove()
            cutscene:wait(0.5)
            cutscene:text("* And as for you...", "sorrowful", "ceroba")
            cutscene:text("* This is all your fault,[wait:5] isn't it?", "dissapproving", "ceroba")
            cutscene:text("* Reports of multiple citizens going missing...", "sorrowful", "ceroba")
            cutscene:text("* You [color:red]killed[color:reset] them,[wait:5] haven't you?", "irked", "ceroba")
            cutscene:text("* ...", "sorrowful", "ceroba")
            if cutscene:getCharacter("kris") or cutscene:getCharacter("hero") or cutscene:getCharacter("jamm_lw") or cutscene:getCharacter("jammarcy_light") then
                cutscene:text("* And I thought that humans were not so bad after all...", "closed_eyes", "ceroba")
                cutscene:text("* And then you appear.[wait:10] What's even the purpose of this?", "dissapproving", "ceroba")
                cutscene:text("* You want revenge?[wait:10] Justice?", "irked", "ceroba")
            else
                if #Game.party == 1 then
                    cutscene:text("* You're not even human...", "dissapproving", "ceroba")
                else
                    cutscene:text("* There's not even humans among you.", "dissapproving", "ceroba")
                end
                cutscene:text("* So why would you slay your own kind?!", "irked", "ceroba")
                cutscene:text("* LITERALLY WHAT IS WRONG WITH YOU?!", "furious", "ceroba")
            end
            cutscene:text("* ...", "sorrowful", "ceroba")
            cutscene:wait(cutscene:walkTo(ceroba, ceroba.x, ceroba.y + 40, 0.4, "down"))
            cutscene:wait(cutscene:walkTo(ceroba, ceroba.x - 160, ceroba.y, 0.8, "left"))
            cutscene:wait(1)
            ceroba:setFacing("right")
            cutscene:text("* If I ever see you again...", "sorrowful", "ceroba")
            cutscene:text("* You're dead.", "deathstare", "ceroba")
            cutscene:wait(cutscene:walkTo(ceroba, ceroba.x - 200, ceroba.y, 1, "left"))
            ceroba:remove()
            cutscene:attachCamera()
            cutscene:attachFollowers()
            cutscene:wait(1.5)
            Assets.playSound("ominous")
            Game:setFlag("ceroba_waiting", true)
        else
            if Game:getFlag("axis_dead") then
                axis:setSprite("dead_regular")
            else
                cutscene:text("* . . .", "damaged", "axis")
                cutscene:text("* YOu.. . ARE LeTTING ME\nGO?", "damaged", "axis")
                cutscene:text("* UH. WEIRD DeCISION.", "damaged", "axis")
            end
            cutscene:wait(1.25)
            cutscene:text("* Axis?!", nil, "ceroba")

            Game:rollShiny("ceroba")
            Game.world:spawnNPC("ceroba", 1040, 300)
            local ceroba = cutscene:getCharacter("ceroba")
            cutscene:wait(cutscene:walkTo(ceroba, 1200, ceroba.y, 1, "right"))
        end
    else
        Game.world.music:play("enter_axis", 1)
        cutscene:showNametag("Axis")
        cutscene:text("* HUMAN.", "normal", "axis")
        cutscene:text("* I HAVE HAD IT WITH YOU AND YOUR FRIENDS ESCAPING ME.", "angry", "axis")
        cutscene:text("* OVER,[wait:5] AND OVER,[wait:5] AND OVER.", "angry", "axis")
        cutscene:text("* YOU [ticked] ME OFF AND FOR THAT YOU WILL FACE MY WRATH.", "angry", "axis")
        cutscene:text("* AND YES,[wait:5] I AM YELLING RIGHT NOW.", "angry", "axis")
        cutscene:text("* I JUST DON'T HAVE EXCLAMATION MARK IN MY TYPOGRAPHY BOX.", "normal", "axis")
        cutscene:hideNametag()
        cutscene:wait(1)
        cutscene:showNametag("Axis")
        cutscene:text("* ...", "normal", "axis")
        cutscene:text("* ANYWAY.", "normal", "axis")
        cutscene:text("* PREPARE YOURSELF.[wait:5] BECAUSE I AM ATTACKING NOW.", "angry", "axis")
        cutscene:hideNametag()
        Game.world.music:pause()

        cutscene:wait(2/30) -- uhh add soul transition fakeout here
        Assets.stopAndPlaySound("noise")
        cutscene:fadeOut(0)
        cutscene:wait(2/30)
        cutscene:fadeIn(0)
        cutscene:wait(2/30)
        Assets.stopAndPlaySound("noise")
        cutscene:fadeOut(0)
        cutscene:wait(2/30)
        cutscene:fadeIn(0)
        cutscene:wait(2/30)
        Assets.stopAndPlaySound("noise")
        cutscene:fadeOut(0)
        cutscene:wait(2/30)
        cutscene:fadeIn(0)
        Assets.playSound("battlefall")

        cutscene:wait(1)
        Game.world.music:resume()
        cutscene:showNametag("Axis")
        cutscene:text("* WHAT.", "normal", "axis")
        cutscene:text("* MY PROGRAMMING IS\nPREVENTING ME FROM\nATTACK.", "normal", "axis")
        cutscene:text("* IT SAYS YOU ARE NOT A\nCURRENT THREAT OR\nRESISTING ARREST.", "normal", "axis")
        cutscene:text("* HM.", "normal", "axis")
        cutscene:hideNametag()
        cutscene:wait(1)
        cutscene:slideTo(axis, axis.x, axis.y + 40, 0.2)
        cutscene:wait(0.1)
        cutscene:walkTo(Game.world.player, Game.world.player.x, Game.world.player.y + 40, 0.2, "up", true)
        cutscene:wait(0.5)
        cutscene:showNametag("Axis")
        cutscene:text("* HA.[wait:5] YOU [fool].", "normal", "axis")
        cutscene:text("* THAT WAS AN APPREHENSION ATTEMPT.", "normal", "axis")
        cutscene:text("* AND BY BACKING DOWN YOU OFFICIALY RESISTED IT.", "normal", "axis")
        cutscene:hideNametag()
        cutscene:slideTo(axis, axis.x, axis.y - 40, 0.2)
        cutscene:walkTo(Game.world.player, Game.world.player.x, Game.world.player.y - 40, 0.2, "up")
        cutscene:wait(0.5)
        cutscene:showNametag("Axis")
        cutscene:text("* NOW,[wait:5] TIME TO DIE.", "normal", "axis", {skip=false})
        cutscene:hideNametag()

        Game.world.music:stop()
        cutscene:startLightEncounter("axis")

        if Game:getFlag("axis_dead") then
            axis:setSprite("dead_regular")
        else
            Game.world.music:play("well_be_okay")
            cutscene:text("* I APOLOGIZE FOR\nTORMENTING YOU AND\nCALLING YOU NAMES.", "normal", "axis")
            cutscene:text("* MY CODED PROTOCOL\nBLINDED ME FROM\nSOMETHING...", "normal", "axis")
            cutscene:text("* SOMETHING CALLED...\n\"BASIC DECENCY.\"", "normal", "axis")
        end
        cutscene:text("* Axis?", nil, "ceroba")

        Game:rollShiny("ceroba")
        Game.world:spawnNPC("ceroba", 1040, 300)
        local ceroba = cutscene:getCharacter("ceroba")
        cutscene:wait(cutscene:walkTo(ceroba, 1200, ceroba.y, 1, "right"))
        ceroba:alert()
        if Game:getFlag("axis_dead") then
            cutscene:text("* !!!", "nervous", "ceroba")
            cutscene:wait(cutscene:walkTo(ceroba, 1400, ceroba.y, 1, "up"))
            cutscene:wait(cutscene:walkTo(ceroba, ceroba.x, axis.y + 40, 1, "up"))
            cutscene:text("* Axis! Hey!", "nervous", "ceroba")
            cutscene:wait(3)
            cutscene:text("* Are you...", "pensive", "ceroba")
        else
            cutscene:text("* ...", "surprised", "ceroba")
            cutscene:text("* Who are you? What are you doing here?", "surprised", "ceroba")
        end
    end

    --cutscene:detachCamera()
    --cutscene:detachFollowers()

end