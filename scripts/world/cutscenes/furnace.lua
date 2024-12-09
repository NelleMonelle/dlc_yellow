return {
    axis = function(cutscene, event)
        ---@param cutscene WorldCutscene
        local axis = cutscene:getCharacter("axis")

        cutscene:wait(cutscene:walkTo(Game.world.player, axis.x, Game.world.player.y, 1, "up"))
        cutscene:wait(1.25)

        if Game:getFlag("axis_hurt") then
            if Game:getFlag("steamworks_kills") >= 20 then
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

            cutscene:startLightEncounter("axis_geno")

            if Game:getFlag("steamworks_kills") >= 20 then
                Game.world:spawnNPC("ceroba", axis.x, axis.y + 40)
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

                --Game.world:spawnNPC("ceroba", x, y)
            end
        else
            Game.world.music:play("enter_axis")
            cutscene:text("* HUMAN.", "normal", "axis")
            cutscene:text("* YOU HAVE ANGERED ME\nGREATLY.", "normal", "axis")
            cutscene:text("* I HAVE HAD IT WITH YOU\nDOING NOTHING AS I FAIL\nOVER AND OVER.", "normal", "axis")
            cutscene:text("* DO YOU KNOW HOW HARD IT\nWAS TO GET THE ACID OUT\nOF MY STEEL?", "normal", "axis")
            cutscene:text("* I HAD TO PUT MYSELF IN\nA WASHING MACHINE. IT\nWAS QUITE DIZZYING.", "normal", "axis")
            cutscene:text("* THOUGH I DO FEEL, AS\nTHE KIDS SAY: \"FRESH AS\nHELL.\"", "normal", "axis")
            cutscene:wait(1)
            cutscene:text("* ...", "normal", "axis")
            cutscene:text("* ANYWAY.", "normal", "axis")
            cutscene:text("* IF YOU CANNOT TELL, I\nAM [ticked] OFF AND OUT\nOF NON-LETHAL OPTIONS.", "normal", "axis")
            cutscene:text("* THAT, AND THIS FURNACE\nHAS A NICE \"TIME TO DIE\"\nAESTHETIC TO IT.", "normal", "axis")
            cutscene:text("* SO PREPARE YOURSELF. I\nAM ATTACKING NOW.", "normal", "axis")

            cutscene:startLightEncounter("axis")
        end

        --cutscene:detachCamera()
        --cutscene:detachFollowers()

    end,
    backtrack_blocker = function(cutscene, event)
        cutscene:text("* (Shouldn't leave right now.)")
        cutscene:wait(cutscene:walkTo(Game.world.player, Game.world.player.x - 40, Game.world.player.y, 0.4, "left"))
    end
}