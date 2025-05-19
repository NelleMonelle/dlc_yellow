return {
    ---@param cutscene WorldCutscene
    ceroba = function(cutscene, event)
        local ceroba = Game.world:getCharacter("ceroba")
        ceroba:setPosition(320, 520)
        ceroba:setFacing("up")
        cutscene:text("* I'm so sorry,[wait:5] Clover...", nil, "ceroba", {skip=false})
        cutscene:wait(cutscene:panTo(320, 560, 1))
        cutscene:text("* I...[wait:10] I couldn't...[wait:10]", nil, "ceroba", {skip=false, top=false, wait=false, auto=true})
        cutscene:wait(cutscene:walkTo(Game.world.player, 320, 760, 2, "up"))
        ceroba:alert()
        cutscene:wait(0.5)
        ceroba:setFacing("down")
        cutscene:wait(0.5)
        cutscene:text("* You.", "deathstare", "ceroba", {top=false})
        cutscene:text("* I know what you did.", "angry", "ceroba")
        cutscene:text("* And I have every right to make you pay for that.", "angry", "ceroba")
        cutscene:text("* If you take another step further...", "angry_alt", "ceroba")
        if Game.party == 1 then
            cutscene:text("* I won't hesitate to put your life to an end.", "angry_alt", "ceroba")
        else
            cutscene:text("* I won't hesitate to put your lifes to an end.", "angry_alt", "ceroba")
        end
        cutscene:panTo(320, 480, 1)
        cutscene:wait(cutscene:walkTo(Game.world.player, 320, 720, 1, "up"))
        cutscene:wait(0.5)
        ceroba:setFacing("up")
        cutscene:text("* My words don't intimidate you,[wait:5] huh?", nil, "ceroba")
        cutscene:text("* Well,[wait:5] in that case...", nil, "ceroba")
        ceroba:setFacing("down")
        cutscene:wait(0.1)
        ceroba:setSprite("run/down")
        ceroba:play(1/12)
        cutscene:wait(cutscene:slideTo(ceroba, Game.world.player.x, Game.world.player.y - 40, 0.5))
        cutscene:startLightEncounter("ceroba_geno")
        if Game:getFlag("ceroba_spared") then
            ceroba:setSprite("battle/defeat_1")
            ceroba:convertToNPC({text="[voice:default]* (She's asleep.)"})
            Assets.playSound("ominous_cancel")
        else
            ceroba:remove()
            Assets.playSound("ominous")
            if Game.world:getCharacter("susie") then
                cutscene:text("* [speed:0.1]...", "bangs_neutral", "susie")
            end
        end
    end,
    ceroba_geno = function(cutscene, event)
        local ceroba = Game.world:getCharacter("ceroba")
        cutscene:text("* I'm so sorry,[wait:5] Clover...", nil, "ceroba", {skip=false})
        cutscene:wait(cutscene:panTo(320, 560, 1))
        cutscene:text("* I...[wait:10] I couldn't...[wait:10]", nil, "ceroba", {skip=false, top=false, wait=false, auto=true})
        cutscene:wait(cutscene:walkTo(Game.world.player, 320, 760, 2, "up"))
        ceroba:alert()
        cutscene:wait(0.5)
        ceroba:setFacing("down")
        cutscene:wait(0.5)
        cutscene:text("* You.", "deathstare", "ceroba", {top=false})
        cutscene:text("* I know what you did.", "angry", "ceroba")
        cutscene:text("* And I have every right to make you pay for that.", "angry", "ceroba")
        cutscene:text("* If you take another step further...", "angry_alt", "ceroba")
        if Game.party == 1 then
            cutscene:text("* I won't hesitate to put your life to an end.", "angry_alt", "ceroba")
        else
            cutscene:text("* I won't hesitate to put your lifes to an end.", "angry_alt", "ceroba")
        end
        cutscene:panTo(320, 480, 1)
        cutscene:wait(cutscene:walkTo(Game.world.player, 320, 720, 1, "up"))
        cutscene:wait(0.5)
        ceroba:setFacing("up")
        cutscene:text("* My words don't intimidate you,[wait:5] huh?", nil, "ceroba")
        cutscene:text("* Well,[wait:5] in that case...", nil, "ceroba")
        ceroba:setFacing("down")
        cutscene:wait(0.1)
        ceroba:setSprite("run/down")
        ceroba:play(1/12)
        cutscene:wait(cutscene:slideTo(ceroba, Game.world.player.x, Game.world.player.y - 40, 0.5))
        cutscene:startLightEncounter("ceroba_geno")
        if Game:getFlag("ceroba_spared") then
            ceroba:setSprite("battle/defeat_1")
            ceroba:convertToNPC({text="[voice:default]* (She's asleep.)"})
            Assets.playSound("ominous_cancel")
        else
            ceroba:remove()
            Assets.playSound("ominous")
            if Game.world:getCharacter("susie") then
                cutscene:text("* [speed:0.1]...", "bangs_neutral", "susie")
            end
        end
    end
}
